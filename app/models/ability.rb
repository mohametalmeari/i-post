class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new

    can :create, Post
    can :manage, Post, { public: true }
    cannot :destroy, Post, { public: true }
    can :manage, Post, { user_id: user.id }
    can :manage, PostLike, { user_id: user.id }
    
    can :manage, Comment, post: { public: true }
    cannot :destroy, Comment
    can :destroy, Comment, { user_id: user.id }
    can :manage, CommentLike, { user_id: user.id }

    can :manage, CommentReply
    cannot :destroy, CommentReply
    can :destroy, CommentReply, { user_id: user.id }
    can :manage, ReplyLike, { user_id: user.id }
    
    can :manage, :all if user.role == 'admin'
  end
end