class HomeController < ApplicationController
  def index
    @all_posts = if user_signed_in?
                   Post.where('public = ? OR user_id = ? OR ?', true, current_user.id, current_user.role == 'admin')
                 else
                   Post.where(public: true)
                 end
    @posts = @all_posts.order(created_at: :desc).limit(4)
  end

  def about; end
end
