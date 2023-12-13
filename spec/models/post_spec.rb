require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new(email: 'user@email.com', password: '753951', username: 'user', name: 'user')
  it 'title should be present' do
    post = Post.new(content: 'Bla bla bla ...', user: user)
    expect(post).to_not be_valid
  end

  it 'content should be present' do
    post = Post.new(title: 'New Post', user: user)
    expect(post).to_not be_valid
  end

  it 'user should be present' do
    post = Post.new(title: 'New Post', content: 'Bla bla bla ...')
    expect(post).to_not be_valid
  end

end
