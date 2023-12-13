require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.new(email: 'user@email.com', password: '753951', username: 'user', name: 'user')
  post = Post.new(title: 'New Post', content: 'Bla bla bla ...', user:)

  it 'content should be present' do
    comment = Comment.new(user:, post:)
    expect(comment).to_not be_valid
  end

  it 'user should be present' do
    comment = Comment.new(content: 'Bla bla bla ...', post:)
    expect(comment).to_not be_valid
  end

  it 'post should be present' do
    comment = Comment.new(content: 'Bla bla bla ...', user:)
    expect(comment).to_not be_valid
  end

  it 'content, user, post should be present' do
    comment = Comment.new(content: 'Bla bla bla ...', user:, post:)
    expect(comment).to be_valid
  end
end
