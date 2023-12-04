class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :comment_likes, foreign_key: 'comment_id', dependent: :destroy
  has_many :comment_replies, foreign_key: 'comment_id', dependent: :destroy
  validates :content, presence: true
end
return
