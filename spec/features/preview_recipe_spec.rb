require 'spec_helper'

feature 'User can do a search and will recieve a list of preview recipes' do
  before do
    visit '/'
    click_on 'Register'
    fill_in 'Email', with: 'kaylee@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Sign Up'
    expect(page).to have_content 'Registered! Please login now'


    fill_in 'Email', with: 'kaylee@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Submit'
  end

  scenario 'a user can fill in fields to make a search on the Yummly API' do
    pending
    click_on 'Search For Recipes Now'
    fill_in 'ingredients[]', with: 'tomatoes'
    fill_in 'ingredients[]', with: 'chicken'
    fill_in 'ingredients[]', with: 'garlic'
    click_on 'Submit'
    expect(page).to have_content('Based on Your Search..')
  end
end
