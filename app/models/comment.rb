class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :comment_likes, foreign_key: 'comment_id', dependent: :destroy
  has_many :comment_replies, foreign_key: 'comment_id', dependent: :destroy
  validates :content, presence: true
  def self.count_comments(post)
    count = where(post: post).count
    if count == 1
      "#{count} Comment"
    elsif count == 0
      "No Comments"
    else
      "#{count} Comments"
    end
  end
end
return
