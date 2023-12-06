class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :comment_likes, foreign_key: 'comment_id', dependent: :destroy
  has_many :comment_replies, foreign_key: 'comment_id', dependent: :destroy
  validates :content, presence: true
  def count_likes
    count = CommentLike.where(comment: self).count
    if count == 1
      "#{count} Like"
    elsif count.zero?
      'No Likes'
    else
      "#{count} Likes"
    end
  end

  def count_replies
    count = CommentReply.where(comment: self).count
    if count == 1
      "#{count} Reply"
    elsif count.zero?
      'No Replies'
    else
      "#{count} Replies"
    end
  end
end
return
