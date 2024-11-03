class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # if user = User.find_by(username: params[:username])
    #   login user
    #   redirect_to root_path
    # else
    #   @user = User.new(user_params)
    #   if @user.save
    #     login @user
    #     redirect_to root_path
    #   else
    #     render :new, status: :unprocessable_entity
    #   end
    # end
    @user = User.new(user_params)
    if @user.save
      login @user
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
