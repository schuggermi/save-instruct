class NfcsController < ApplicationController
  before_action :set_task, only: [:new, :create]
  before_action :set_nfc, only: :destroy

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

  def destroy
    @nfc.destroy
    redirect_to task_path(@nfc.task), status: :see_other
  end

  private

  def nfc_params
    params.require(:nfc).permit(:serial_number, :position, :url)
  end

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_nfc
    @nfc = Nfc.find(params[:id])
  end
end
