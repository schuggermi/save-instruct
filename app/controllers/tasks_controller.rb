class TasksController < ApplicationController
  before_action :set_task, only: :destroy

  def index
    @tasks = Task.all
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end
end
