class PostLike < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates_uniqueness_of :post_id, scope: :user_id, message: 'You have already liked this.'
  def self.count_likes(post)
    count = where(post: post).count
    if count == 1
      "#{count} Like"
    elsif count == 0
      "No Likes"
    else
      "#{count} Likes"
    end
  end
end
return
