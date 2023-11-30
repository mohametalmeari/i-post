class CreateCommentReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :comment_replies do |t|
      t.text :content

      t.timestamps
    end
  end
end
