require 'rails_helper'

feature 'User signs in' do
  scenario 'user logs in to the site from the homepage' do
    user = FactoryGirl.create(:user)
    visit '/'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on "Log in"

    expect(page).to have_content("Signed in successfully")
    expect(page).to have_content("Find a Nearby Food Truck")
  end
end
