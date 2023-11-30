class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc).limit(100)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = 'Post is live'
      redirect_to posts_path
    else
      flash[:notice] = @post.errors.full_messages.join(', ')
      redirect_to request.referrer
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :public)
  end
end
