class PostsController < ApplicationController
  def index
    if !user_signed_in?
      redirect_to "/login"
    end
  end
end
