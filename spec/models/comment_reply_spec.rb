require 'rails_helper'

RSpec.describe CommentReply, type: :model do
  user = User.new(email: 'user@email.com', password: '753951', username: 'user', name: 'user')
  post = Post.new(title: 'New Post', content: 'Bla bla bla ...', user:)
  comment = Comment.new(content: 'Bla bla bla ...', user:, post:)

  it 'content should be present' do
    reply = CommentReply.new(user:, comment:)
    expect(reply).to_not be_valid
  end

  it 'user should be present' do
    reply = CommentReply.new(content: 'Bla bla bla ...', comment:)
    expect(reply).to_not be_valid
  end

  it 'comment should be present' do
    reply = CommentReply.new(content: 'Bla bla bla ...', user:)
    expect(reply).to_not be_valid
  end

  it 'content, user, comment should be present' do
    reply = CommentReply.new(content: 'Bla bla bla ...', user:, comment:)
    expect(reply).to be_valid
  end
end
