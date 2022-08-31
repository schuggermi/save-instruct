class EmployeeTasksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update
    @employee_task = EmployeeTask.find(params[:id])
    @employee_task.update(task_done: true)

    head :ok
    
  end
end
