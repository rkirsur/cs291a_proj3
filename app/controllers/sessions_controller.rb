class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.find_by(username: params[:username])
      login user
      redirect_to root_path
    end
  end

  def destroy
    logout current_user
    redirect_to "/logout"
  end
end
