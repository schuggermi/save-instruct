class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy]
  # in theory any of the actions associated with this controller will only be
  # available to the manager, it will only go through the managers journey so
  # authentication shant be necessary

  def index
    if params[:query].present?
      @users = User.search_employee(params[:query])
    else
    @users = User.all
    end
  end

  def show
  end

  def delete
    @user.destroy
    # redirect_to_users_path, status: :see_other
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.update(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], rank: params[:rank], password: params[:password][:password_confirmation] )
    redirect_to employee_path(@user)
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
