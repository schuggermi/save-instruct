class EmployeeTasksController < ApplicationController
  before_action :set_task, only: :new

  def new
    @employee_task = EmployeeTask.new
    @employees = User.where(admin: false)
  end

  def create
    raise
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end
end
