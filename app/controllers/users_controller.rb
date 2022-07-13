class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    @user.balance = 0
    @user.role_id = 1
    if @user.save
      sign_in @user
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
