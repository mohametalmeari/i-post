class CommentLike < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  validates_uniqueness_of :comment_id, scope: :user_id, message: 'You have already liked this.'
  def self.count_likes(comment)
    count = where(comment:).count
    if count == 1
      "#{count} Like"
    elsif count.zero?
      'No Likes'
    else
      "#{count} Likes"
    end
  end
end
return
