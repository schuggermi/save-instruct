class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy, :update]
  # in theory any of the actions associated with this controller will only be
  # available to the manager, it will only go through the managers journey so
  # authentication shant be necessary

  def index
    @users = User.all

    if params[:query].present?
      @users = User.search_employee(params[:query])
    else
      @users = User.all
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "users/employee_card", locals: { users: @users }, formats: [:html] }
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to employee_path(@user), notice: "Profile was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to employees_path, status: :see_other, notice: "this person has been either fired or eaten by sharks"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :rank, :username, :email, :photo)
  end
end
