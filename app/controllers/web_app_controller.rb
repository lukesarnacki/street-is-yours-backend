class WebAppController < ApplicationController
  def index
    if @current_user
      redirect_to issues_path
    end
  end
end
