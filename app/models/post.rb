class Post < ApplicationRecord
  belongs_to :user
  has_many :post_likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'
end
return
