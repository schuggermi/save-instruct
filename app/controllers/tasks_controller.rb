class TasksController < ApplicationController
  before_action :set_task, only: %i[show destroy edit update]

  def index
    @tasks = Task.all
  end

  def show
    @employee_tasks = @task.employee_tasks

    @my_employee_tasks = @employee_tasks.where(user_id: current_user.id)
  end

  def new
    @task = Task.new
    @task.steps.build
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: "Task was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, steps_attributes: %i[instruction info id _destroy])
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
