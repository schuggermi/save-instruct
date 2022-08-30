class NfcsController < ApplicationController
  before_action :set_task, only: :new

  def new
    @nfc = Nfc.new
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end
end
