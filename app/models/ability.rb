class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    post_ablities(user)
    comment_ablities(user)
    can :manage, :all if user.role == 'admin'
  end

  def post_ablities(user)
    can :create, Post
    can :manage, Post, { public: true }
    can :manage, Post, { user_id: user.id }
    cannot :destroy, Post do |post|
      post.user_id != user.id
    end
    cannot :update, Post do |post|
      post.user_id != user.id
    end
    can :manage, PostLike, { user_id: user.id }
  end

  def comment_ablities(user)
    can :manage, Comment, post: { public: true }
    cannot :destroy, Comment do |comment|
      comment.user_id != user.id
    end
    can :manage, CommentLike, { user_id: user.id }
    can :manage, CommentReply
    cannot :destroy_reply, CommentReply do |comment_reply| # custom action defined in comments_controller
      comment_reply.user_id != user.id
    end
    can :manage, ReplyLike, { user_id: user.id }
  end
end
