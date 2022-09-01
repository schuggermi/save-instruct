class EmployeeTasksController < ApplicationController
  before_action :set_task, only: [:new, :create]

  def new
    @employee_task = EmployeeTask.new
    @employees = User.where(admin: false)
  end

  def create
    if params[:user_ids].blank?
      EmployeeTask.where(task: @task).destroy_all
    else
      params[:user_ids].each do |user|
        e_task = EmployeeTask.find_by(user: user.to_i)
        if e_task.blank?
          @employee_task = EmployeeTask.new
          @employee_task.task = @task
          @employee_task.user = User.find(user)
          if @employee_task.save
            redirect_to task_path(@employee_task.task)
          else
            render :new, status: :unprocessable_entity
          end
        else

        end
      end
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
