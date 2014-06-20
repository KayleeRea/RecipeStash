require 'spec_helper'

feature 'User Login' do
  scenario 'user can register' do
    visit '/'
    click_on 'Register'
    fill_in 'Email', with: 'kaylee@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Sign Up'
    expect(page).to have_content 'Registered! Please login now'


    fill_in 'Email', with: 'kaylee@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Submit'
    expect(page).to have_content 'Welcome, kaylee@example.com'
    expect(page).to have_content 'Logout'


    click_on 'Logout'
    expect(page).to_not have_content 'Welcome, kaylee@example.com'
  end
end