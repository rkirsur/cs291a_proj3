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

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user.username
    @post.comments = 0

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end
end
