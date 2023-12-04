class CommentReply < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  has_many :reply_likes, foreign_key: 'comment_reply_id', dependent: :destroy
  validates :content, presence: true
end
return
