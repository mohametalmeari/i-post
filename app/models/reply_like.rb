class ReplyLike < ApplicationRecord
  belongs_to :user
  belongs_to :comment_reply
end
return
