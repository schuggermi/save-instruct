class NfcsController < ApplicationController
  before_action :set_task, only: [:new, :create]

  def new
    @nfc = Nfc.new
  end

  def create
    @nfc = Nfc.new(nfc_params)
    @nfc.task = @task
    if @nfc.save
      redirect_to task_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def nfc_params
    params.require(:nfc).permit(:serial_number, :position, :url)
  end

  def set_task
    @task = Task.find(params[:task_id])
  end
end
