class User < ApplicationRecord
  has_many :posts, foreign_key: 'user_id', dependent: :destroy
  has_many :comments, foreign_key: 'user_id', dependent: :destroy
  has_many :post_likes, foreign_key: 'user_id', dependent: :destroy
  has_many :comment_likes, foreign_key: 'user_id', dependent: :destroy
  has_many :comment_replies, foreign_key: 'user_id', dependent: :destroy
  has_many :reply_likes, foreign_key: 'user_id', dependent: :destroy

  validates :name, presence: true
  validates :username, presence: true,
                       format: { with: /\A[a-zA-Z][a-zA-Z0-9]*\z/, message: 'can only contain letters and numbers' },
                       uniqueness: { case_sensitive: false, message: 'has already been taken' }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
return
