class StepsController < ApplicationController
  before_action :set_step, only: %i[show destroy edit update move]

  def new
    @step = Step.new
  end

  def show
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    @step.task_id = params[:task_id]
    @step.save
    redirect_to task_path(@step.task)
  end

  def update
    @task = Task.find(params[:task_id])
    @step = Step.find(params[:id])
    @step.update(step_params)

    respond_to do |format|
      format.html { redirect_to task_path(@task) }
      format.text { render partial: "steps/steps_info", locals: { step: @step }, formats: [:html] }
    end
  end

  def move
    @step.insert_at(params[:new_position].to_i)
    head :ok
  end

  private

  def step_params
    params.require(:step).permit(:instruction, :info, :position, :order)
  end

  def set_step
    @step = Step.find(params[:id])
  end
end
