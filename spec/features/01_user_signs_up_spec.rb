require 'rails_helper'

feature "User signs up" do
  scenario "User creates an account" do

    visit '/'
    click_on "Sign Up"

    expect(page).to have_content "Create an Account"

    fill_in 'Email', with: "shapaek@gmail.com"
    fill_in 'Password', with: "blabla"
    fill_in 'Password confirmation', with: "blabla"
    click_on "Sign up"

    expect(page).to have_content "Welcome! You have signed up successfully"
    expect(page).to have_content "Find a Nearby Food Truck"
  end
end
