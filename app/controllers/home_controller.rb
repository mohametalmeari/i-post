class HomeController < ApplicationController
  def index
    @all_posts = Post.where('public = ? OR user_id = ? OR ?', true, current_user.id, current_user.role == 'admin')
    # @posts = @all_posts.where(public: true).order(created_at: :desc).limit(3)
    @posts = @all_posts.order(created_at: :desc).limit(3)
  end

  def about; end
end
