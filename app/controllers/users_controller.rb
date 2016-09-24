class UsersController < ApplicationController
  before_action :save_login_state

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:notice] = "You signed up successfully"
      flash.now[:color] = "success"
      redirect_to root_path
    else
      flash.now[:alert] = "Form is invalid"
      flash.now[:color]= "danger"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
