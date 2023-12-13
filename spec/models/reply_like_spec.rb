require 'rails_helper'

RSpec.describe ReplyLike, type: :model do
  user = User.new(email: 'user@email.com', password: '753951', username: 'user', name: 'user')
  post = Post.new(title: 'New Post', content: 'Bla bla bla ...', user:)
  comment = Comment.new(content: 'Bla bla bla ...', user:, post:)
  reply = CommentReply.new(content: 'Bla bla bla ...', user:, comment:)

  it 'user should be present' do
    like = ReplyLike.new(comment_reply: reply)
    expect(like).to_not be_valid
  end

  it 'reply should be present' do
    like = ReplyLike.new(user:)
    expect(like).to_not be_valid
  end

  it 'user, reply should be present' do
    like = ReplyLike.new(user:, comment_reply: reply)
    expect(like).to be_valid
  end

  it 'to be unique' do
    like = ReplyLike.new(user:, comment_reply: reply)
    like.save
    like2 = ReplyLike.new(user:, comment_reply: reply)
    expect(like2).to_not be_valid
  end
end
