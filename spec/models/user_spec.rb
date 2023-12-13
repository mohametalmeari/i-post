require 'rails_helper'

RSpec.describe User, type: :model do
  it 'name should be present' do
    user = User.new(email: 'user@email.com', password: '753951', username: 'user')
    expect(user).to_not be_valid
  end

  it 'username should be present' do
    user = User.new(email: 'user@email.com', password: '753951', name: 'user')
    expect(user).to_not be_valid
  end

  it 'email should be present' do
    user = User.new(password: '753951', name: 'user', username: 'user')
    expect(user).to_not be_valid
  end

  it 'password should be present' do
    user = User.new(email: 'user@email.com', name: 'user', username: 'user')
    expect(user).to_not be_valid
  end

  it 'email should has @' do
    user = User.new(email: 'useremail', password: '753951', name: 'user', username: 'user')
    expect(user).to_not be_valid
  end

  it 'name, username, email, password should be present' do
    user = User.new(email: 'user@email.com', password: '753951', name: 'user', username: 'user')
    expect(user).to be_valid
  end
end
