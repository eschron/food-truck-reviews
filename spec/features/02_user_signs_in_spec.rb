require 'rails_helper'

feature 'User signs in' do
  scenario 'user logs in to the site from the homepage' do
    user = FactoryGirl.create(:user)
    truck = FactoryGirl.create(:truck)
    visit '/'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on "Log in"

    expect(page).to have_content("Signed in successfully")
    expect(page).to have_content("Welcome!")
  end

  scenario 'user signs in with an incorrect password' do
    user = FactoryGirl.create(:user)
    visit '/'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: "access"
    click_on "Log in"

    expect(page).to have_content("Invalid Email or password")
    expect(page).not_to have_content("Find a Nearby Food Truck")
  end

  scenario 'user signs in without an eamil' do
    user = FactoryGirl.create(:user)
    visit '/'

    fill_in 'Password', with: user.password
    click_on "Log in"

    expect(page).to have_content("Invalid Email or password")
    expect(page).not_to have_content("Find a Nearby Food Truck")
  end
end
