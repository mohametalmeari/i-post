class ReplyLike < ApplicationRecord
  belongs_to :user
  belongs_to :comment_reply
  validates_uniqueness_of :comment_reply_id, scope: :user_id, message: 'You have already liked this.'
end
return
