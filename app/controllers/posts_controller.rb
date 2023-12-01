class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc).limit(100)
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

  def show
    @post = Post.find(params[:id])
    @like_text = 'Like'
    @like_text = 'Unlike' if PostLike.find_by(post: @post, user: current_user)
    @post_like = PostLike.new
    @comments = Comment.where(post: @post)
    @comment = Comment.new
  end

  def like
    like = PostLike.find_by(post: like_param[:post_id], user: current_user)
    if like
      like.destroy
      flash[:notice] = 'You unliked the post'
    else
      post_like = PostLike.new(like_param)
      post_like.user = current_user
      flash[:notice] = if post_like.save
                         'You liked the post'
                       else
                         post_like.errors.full_messages.join(', ')
                       end
    end
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

  private

  def post_params
    params.require(:post).permit(:title, :content, :public)
  end

  def like_param
    params.require(:post_like).permit(:post_id)
  end

  def comment_params
    params.require(:comment).permit(:post_id, :content)
  end
end
