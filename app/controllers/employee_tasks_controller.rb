class EmployeeTasksController < ApplicationController
  before_action :set_task, only: [:new, :create]

  def new
    @employee_task = EmployeeTask.new

    if params[:query].present?
      sql_query = "first_name ILIKE :query OR last_name ILIKE :query"
      @employees = User.where(sql_query, query: "%#{params[:query]}%").order('lower(first_name)')
    else
      @employees = User.where(admin: false).order('lower(first_name)')
    end
  end

  def create
    @employee_tasks = EmployeeTask.where(task: @task)
    @employee_tasks_user_ids = [] # ["24", "1", "2"]
    @user_ids = params[:user_ids] # ["24", "16"]

    # If no employee was checked, delete all EmployeeTask related to current Task and finish
    if params[:user_ids].blank?
      EmployeeTask.where(task: @task).destroy_all
      redirect_to task_path(@task)
      return
    end

    # Create array with id of users assigned already to task for later comparison
    @employee_tasks.each do |e_task|
      @employee_tasks_user_ids << e_task.user.id.to_s
    end

    # Process every user id received in the form
    params[:user_ids].each do |user|
      # If user id already exists, the record remains untouched
      # If not exists, create new record
      if !@employee_tasks_user_ids.include?(user)
        @employee_task = EmployeeTask.new
        @employee_task.task = @task
        @employee_task.user = User.find(user)

        @employee_task.save
      end
    end

    # If user id of EmployeeTask is not included in params[:user_ids], then user was removed from Task and need to delete the record
    @employee_tasks.each do |e_task|
      @user_ids.include?(e_task.user.id.to_s) ? next : e_task.destroy
    end

    redirect_to task_path(@task)
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
