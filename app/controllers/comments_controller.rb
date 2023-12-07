class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, notice: 'Access denied'
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = Comment.find_by(post_id: params[:post_id], id: params[:id])
    @comment_like = CommentLike.new
    @comment_reply = CommentReply.new
    @comment_replies = CommentReply.where(comment: @comment)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to post_path(params[:post_id]), notice: 'Comment deleted.'
  end

  def reply
    comment_reply = CommentReply.new(reply_params)
    comment_reply.user = current_user
    flash[:notice] = if comment_reply.save
                       'You replied on the comment'
                     else
                       comment_reply.errors.full_messages.join(', ')
                     end
    redirect_to request.referrer
  end

  def destroy_reply
    comment_reply = CommentReply.find(params[:reply_id])
    authorize! :destroy_reply, comment_reply # custom action
    comment_reply.destroy
    redirect_to request.referrer, notice: 'Reply deleted.'
  end

  def like_reply
    reply = CommentReply.find(params[:reply_id])
    like = ReplyLike.new(comment_reply: reply, user: current_user)
    like.save
    redirect_to request.referrer
  end

  def unlike_reply
    like = ReplyLike.find_by(comment_reply: params[:reply_id], user: current_user)
    like.destroy
    redirect_to request.referrer
  end

  private

  def reply_params
    params.require(:comment_reply).permit(:comment_id, :content)
  end

  def reply_like_param
    params.require(:reply_like).permit(:comment_reply_id)
  end
end
