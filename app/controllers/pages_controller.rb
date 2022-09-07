class PagesController < ApplicationController
  def dashboard
    @tasks = Task.count
    @nfcs = Nfc.count
    @employees = User.count
  end
end
