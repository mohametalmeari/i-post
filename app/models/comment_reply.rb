class CommentReply < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  has_many :reply_likes, foreign_key: 'comment_reply_id', dependent: :destroy
  validates :content, presence: true
  def count_likes
    count = ReplyLike.where(comment_reply: self).count
    if count == 1
      "#{count} Like"
    elsif count.zero?
      'No Likes'
    else
      "#{count} Likes"
    end
  end
end
