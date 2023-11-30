class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :comment_likes, foreign_key: 'comment_id'
  has_many :comment_replies, foreign_key: 'comment_id'
end
return
