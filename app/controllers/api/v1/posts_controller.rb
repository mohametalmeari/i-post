class Api::V1::PostsController < ApplicationController
  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, notice: 'Access denied'
  end

  def index
    @posts = Post.where('public = true').order(created_at: :desc).limit(100)
    render json: @posts.map { |p|
                   {
                     id: p.id,
                     title: p.title,
                     content: p.content,
                     author: p.user.name,
                     likes: p.count_likes,
                     comments: p.comments.map do |c|
                                 {
                                   id: c.id,
                                   comment: c.content,
                                   author: c.user.name,
                                   likes: c.count_likes,
                                   replies: c.comment_replies.map do |r|
                                              {
                                                id: r.id,
                                                reply: r.content,
                                                author: r.user.name,
                                                likes: r.count_likes
                                              }
                                            end
                                 }
                               end
                   }
                 }
  end
end
