class TasksController < ApplicationController
  before_action :set_task, only: %i[show destroy edit update]

  def index
    if current_user.admin?
      if params[:query].present?
        @tasks = Task.where("name ILIKE ?", "%#{params[:query]}%")
      else
        @tasks = Task.all
      end
    else
      if params[:query].present?
        @employee_tasks = EmployeeTask.where(user_id: current_user.id)
      else
        @employee_tasks = EmployeeTask.where(user_id: current_user.id)
      end
    end
  end

  def show
    @employee_tasks = @task.employee_tasks
    @steps = @task.steps.order(:order)
    @my_employee_tasks = @employee_tasks.where(user_id: current_user.id)
  end

  def new
    @task = Task.new
    @task.steps.build
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      order_steps(@task.steps)
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

  def order_steps(task_steps)
    order = 1
    task_steps.ids.sort.each do |step_id|
      Step.find(step_id).update(order: order)
      order += 1
    end
  end

  def task_params
    params.require(:task).permit(:name, :description, steps_attributes: %i[instruction info id _destroy order])
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
