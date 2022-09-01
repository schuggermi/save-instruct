class EmployeeTasksController < ApplicationController
  before_action :set_task, only: [:new, :create]

  def new
    @employee_task = EmployeeTask.new
    @employees = User.where(admin: false)
  end

  def create
    @employee_tasks = EmployeeTask.where(task: @task)
    @employee_tasks_user_ids = []
    @user_ids = params[:user_ids]

    if params[:user_ids].blank?
      EmployeeTask.where(task: @task).destroy_all
      redirect_to task_path(@task)
      return
    end

    @employee_tasks.each do |e_task|
      @employee_tasks_user_ids << e_task.user.id
      @user_ids.include?(e_task.user.id) ? next : e_task.destroy
    end

    params[:user_ids].each do |user|
      @employee_task = EmployeeTask.new
      @employee_task.task = @task
      @employee_task.user = User.find(user)
      next if @employee_task.save

      render :new, status: :unprocessable_entity
    end

    redirect_to task_path(@employee_task.task)
  end

  def update
    @employee_task = EmployeeTask.find(params[:id])
    @employee_task.update(task_done: DateTime.now)

    respond_to do |format|
      format.html { redirect_to task_path(@employee_task.task_id) }
      format.text { render partial: "tasks/done_task", locals: { employee_task: @employee_task }, formats: [:html] }
    end
  end

  private

  def employee_task_params
    params.require(:employee_task).permit(user_ids: [])
  end

  def set_task
    @task = Task.find(params[:task_id])
  end

end
