class CommentsController < ApplicationController
  def show
    @comment = Comment.find_by(post_id: params[:post_id], id: params[:id])
    @comment_like = CommentLike.new
  end
end
