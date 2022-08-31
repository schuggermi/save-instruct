class EmployeesController < ApplicationController
  # before_action :authorize_user
  # in theory any of the actions associated with this controller will only be
  # available to the manager, it will only go through the managers journey so
  # authentication shant be necessary

  def show
    @user = User.find(params[:id])
  end

  def index
    @user = User.all
  end

  def delete
    User.find(params[:id]).destroy
    redirect_to_users_path, status: :see_other
  end

  # def create
  #   @user = User.new(user_params)
  # end

  # private

  # def user_params

  #   params.require(:user).permit(:first_name, :last_name, :rank, :username, :email)
  # end

end
