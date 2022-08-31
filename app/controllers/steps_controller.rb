class StepsController < ApplicationController
  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    @step.save
    redirect_to root
  end

  private

  def step_params
    params.require(:step).permit(:instruction, :info)
  end
end
