class AddPostRefToPostLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :post_likes, :post, null: false, foreign_key: true
  end
end
