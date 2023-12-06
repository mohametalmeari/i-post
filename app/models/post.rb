class Post < ApplicationRecord
  belongs_to :user
  has_many :post_likes, foreign_key: 'post_id', dependent: :destroy
  has_many :comments, foreign_key: 'post_id', dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true

  def count_likes
    count = PostLike.where(post: self).count
    if count == 1
      "#{count} Like"
    elsif count.zero?
      'No Likes'
    else
      "#{count} Likes"
    end
  end

  def count_comments
    comments = Comment.where(post: self)
    count = comments.count
    comments.each do |comment|
      count += CommentReply.where(comment:).count
    end
    if count == 1
      "#{count} Comment"
    elsif count.zero?
      'No Comments'
    else
      "#{count} Comments"
    end
  end
end
return
