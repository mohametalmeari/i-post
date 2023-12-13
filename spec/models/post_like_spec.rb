require 'rails_helper'

RSpec.describe PostLike, type: :model do
  user = User.new(email: 'user@email.com', password: '753951', username: 'user', name: 'user')
  post = Post.new(title: 'New Post', content: 'Bla bla bla ...', user:)

  it 'user should be present' do
    like = PostLike.new(post:)
    expect(like).to_not be_valid
  end

  it 'post should be present' do
    like = PostLike.new(user:)
    expect(like).to_not be_valid
  end

  it 'user, post should be present' do
    like = PostLike.new(user:, post:)
    expect(like).to be_valid
  end

  it 'to be unique' do
    like = PostLike.new(user:, post:)
    like.save
    like2 = PostLike.new(user:, post:)
    expect(like2).to_not be_valid
  end
end
