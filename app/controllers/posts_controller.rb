class PostsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
    if !user_signed_in?
      redirect_to "/login"
    end
  end

  def show
    @post = Post.find(params[:id])
    if !user_signed_in?
      redirect_to "/login"
    end
  end

  def new
    @post = Post.new
    if !user_signed_in?
      redirect_to "/login"
    end
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user.username
    @post.count = 0

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end
end
