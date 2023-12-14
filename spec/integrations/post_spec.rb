require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  user = User.create(username: 'userone', name: 'User One', email: 'userone@example.com', password: '111111')
  scenario 'Create/Delete post' do
    visit new_post_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    fill_in 'Title', with: 'Post Title'
    fill_in 'Content', with: 'Post content ...'
    click_button 'Create Post'
    assert_text 'Post Title'
    assert_text 'Post content ...'
    click_link 'Post Title'
    click_button 'Change to'
    assert_text '#private'
    click_button 'Delete'
    assert_text 'Post deleted'
    sleep 5
  end
end
