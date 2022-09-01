class EmployeeTasksController < ApplicationController
  before_action :set_task, only: :new

  def new
    @employee_task = EmployeeTask.new
    @employees = User.where(admin: false)
  end

  def create
    raise
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

  def set_task
    @task = Task.find(params[:task_id])
  end
  
end
