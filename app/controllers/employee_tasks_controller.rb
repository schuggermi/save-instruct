class EmployeeTasksController < ApplicationController
  def update
    @employee_task = EmployeeTask.find(params[:id])
    @employee_task.update(task_done: DateTime.now)

    respond_to do |format|
      format.html { redirect_to task_path(@employee_task.task_id) }
      format.text { render partial: "tasks/done_task", locals: { employee_task: @employee_task }, formats: [:html] }
    end
  end
end
