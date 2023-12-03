class CommentsController < ApplicationController
  def show
    @comment = Comment.find_by(post_id: params[:post_id], id: params[:id])
    @comment_like = CommentLike.new
    @comment_reply = CommentReply.new
    @comment_replies = CommentReply.where(comment: @comment)
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

  def like_reply
    like = ReplyLike.find_by(comment_reply: reply_like_param[:comment_reply_id], user: current_user)
    if like
      like.destroy
      flash[:notice] = 'You unliked the comment'
    else
      reply_like = ReplyLike.new(reply_like_param)
      reply_like.user = current_user
      flash[:notice] = if reply_like.save
                         'You liked the comment'
                       else
                         reply_like.errors.full_messages.join(', ')
                       end
    end
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
