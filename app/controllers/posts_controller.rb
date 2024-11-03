class PostsController < ApplicationController
  def index
    @posts = Post.all
    if !user_signed_in?
      redirect_to "/login"
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end
