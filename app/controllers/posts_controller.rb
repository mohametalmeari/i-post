class PostsController < ApplicationController
  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, notice: 'Access denied'
  end

  def index
    @posts = Post.where('public = ? OR user_id = ? OR ?', true, current_user.id,
                        current_user.role == 'admin').order(created_at: :desc).limit(100)
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user = current_user
    if post.save
      flash[:notice] = 'Post is live'
      redirect_to posts_path
    else
      flash[:notice] = post.errors.full_messages.join(', ')
      redirect_to request.referrer
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path, notice: 'Post deleted.'
  end

  def update
    post = Post.find(params[:id])
    post.public = if post.public
                    false
                  else
                    true
                  end
    flash[:notice] = (comment.errors.full_messages.join(', ') unless post.save)
    redirect_to request.referrer
  end

  def show
    @post = Post.find(params[:id])
    @like_text = 'Like'
    @like_text = 'Unlike' if PostLike.find_by(post: @post, user: current_user)
    @post_like = PostLike.new
    @comment_like = CommentLike.new
    @comments = Comment.where(post: @post)
    @comment = Comment.new
  end

  def like
    post = Post.find(params[:id])
    like = PostLike.new(post:, user: current_user)
    like.save
    redirect_to request.referrer
  end

  def unlike
    like = PostLike.find_by(post: params[:id], user: current_user)
    like.destroy
    redirect_to request.referrer
  end

  def comment
    comment = Comment.new(comment_params)
    comment.user = current_user
    flash[:notice] = if comment.save
                       'You commented on the post'
                     else
                       comment.errors.full_messages.join(', ')
                     end
    redirect_to request.referrer
  end

  def like_comment
    comment = Comment.find(params[:comment_id])
    like = CommentLike.new(comment:, user: current_user)
    like.save
    redirect_to request.referrer
  end

  def unlike_comment
    like = CommentLike.find_by(comment: params[:comment_id], user: current_user)
    like.destroy
    redirect_to request.referrer
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :public)
  end

  def comment_params
    params.require(:comment).permit(:post_id, :content)
  end
end
