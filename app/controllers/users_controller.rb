class UsersController < ApplicationController
  before_action :set_user, only: :show
  # in theory any of the actions associated with this controller will only be
  # available to the manager, it will only go through the managers journey so
  # authentication shant be necessary

  def index
    @users = User.all
  end

  def show
  end

  def delete
    User.find(params[:id]).destroy
    # redirect_to_users_path, status: :see_other
  end

  # def create
  #   @user = User.new(user_params)
  # end

  private

  def set_user
    @user = User.find(params[:id])
  end
  # def user_params

  #   params.require(:user).permit(:first_name, :last_name, :rank, :password, :username, :email)
  # end

end
