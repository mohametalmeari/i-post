class Post < ApplicationRecord
  belongs_to :user
  has_many :post_likes, foreign_key: 'post_id', dependent: :destroy
  has_many :comments, foreign_key: 'post_id', dependent: :destroy
  validates :title, presence: true
end
return
