class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy, :update]
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

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to employee_path(@user), notice: "Profile was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete
    @user.destroy
    # redirect_to_users_path, status: :see_other
  end

  # def edit
  #   @user = User.find(params[:id])
  #   render :edit
  # end

  # def update
  #   @user = User.find(params[:id])
  #   if @user.update(para,s.require(:user.permit(:email, :first_name, :last_name, :rank, :password, :password_confirmation)))
  #     flash[:success] ="This Profile has been updated, good on ya mate"
  #     redirect_to employee_path(@user)
  #   else
  #     flash.now[:error] = "It didn`t work this time man... why are you even an admin?"
  #     render :edit
  #   end
    # @user.update
    # @user.save
    # @user.update(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], rank: params[:rank], password: params[:password][:password_confirmation] )

  # end


  # def create
  #   @user = User.new(user_params)
  # end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :rank, :username, :email, :photo)
  end

end
