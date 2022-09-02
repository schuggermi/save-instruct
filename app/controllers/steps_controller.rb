class StepsController < ApplicationController
  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    @step.save
    redirect_to root
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

  private

  def step_params
    params.require(:step).permit(:instruction, :info, :position, :order)
  end
end
