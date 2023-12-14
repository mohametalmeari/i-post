require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  scenario 'Sign up / Log out / Log in / Edit user' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', with: 'user@test.com'
    fill_in 'Username', with: 'usertest'
    fill_in 'Name', with: 'User'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    assert_text 'Welcome! You have signed up successfully.'
    click_button 'Sign Out'
    assert_text 'Signed out successfully.'
    click_link 'Sign In'
    fill_in 'Email', with: 'user@test.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    assert_text 'Signed in successfully.'
    click_link 'Profile'
    fill_in 'Email', with: 'alex@test.net'
    fill_in 'Username', with: 'alex'
    fill_in 'Name', with: 'Alex'
    fill_in 'Password', with: '654321'
    fill_in 'Password confirmation', with: '654321'
    fill_in 'Current password', with: '123456'
    click_button 'Update'
    assert_text 'Your account has been updated successfully.'
    click_link 'Profile'
    fill_in 'Current password', with: '654321'
    click_button 'Delete my account'
    page.driver.browser.switch_to.alert.accept
    sleep 1
  end
end
