class PostLike < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates_uniqueness_of :post_id, scope: :user_id, message: 'You have already liked this.'
end
return
