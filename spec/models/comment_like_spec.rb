require 'rails_helper'

RSpec.describe CommentLike, type: :model do
  user = User.new(email: 'user@email.com', password: '753951', username: 'user', name: 'user')
  post = Post.new(title: 'New Post', content: 'Bla bla bla ...', user:)
  comment = Comment.new(content: 'Bla bla bla ...', user:, post:)

  it 'user should be present' do
    like = CommentLike.new(comment:)
    expect(like).to_not be_valid
  end

  it 'comment should be present' do
    like = CommentLike.new(user:)
    expect(like).to_not be_valid
  end

  it 'user, comment should be present' do
    like = CommentLike.new(user:, comment:)
    expect(like).to be_valid
  end

  it 'to be unique' do
    like = CommentLike.new(user:, comment:)
    like.save
    like2 = CommentLike.new(user:, comment:)
    expect(like2).to_not be_valid
  end
end
