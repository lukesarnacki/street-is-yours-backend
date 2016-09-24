class SessionsController < ApplicationController

  def login
    authorized_user = User.authenticate(params[:email],params[:login_password])
    if authorized_user
      flash.now[:notice] = "You logged in as #{authorized_user.email}"
      flash.now[:color]= "success"
      redirect_to issues_path
    else
      flash.now[:notice] = "Invalid email or password"
      flash.now[:color]= "danger"
      render "login"
    end
  end

  private

  def login_params
    param.require(:login)
  end
end
