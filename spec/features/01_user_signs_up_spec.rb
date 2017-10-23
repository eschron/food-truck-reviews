require 'rails_helper'

feature "User signs up" do
  scenario "User creates an account" do

    visit '/'
    click_on "Sign Up"

    expect(page).to have_content "Create an Account"
    fill_in "First name", with: "Shannon"
    fill_in "Last name", with: "Paek"
    fill_in 'Email', with: "blablabla@gmail.com"
    fill_in 'Password', with: "blabla"
    fill_in 'Password confirmation', with: "blabla"
    attach_file('Avatar', File.absolute_path('public/test/test.jpeg'))
    click_on "Sign up"

    expect(page).to have_content "Welcome! You have signed up successfully"
    expect(page).to have_content "Find a Nearby Food Truck"
  end

  scenario "User creates an account without an email" do
    visit '/'
    click_on "Sign Up"

    expect(page).to have_content "Create an Account"

    fill_in "First name", with: "Shannon"
    fill_in "Last name", with: "Paek"
    fill_in 'Password', with: "blabla"
    fill_in 'Password confirmation', with: "blabla"
    click_on "Sign up"

    expect(page).to have_content "Email can't be blank"
    expect(page).not_to have_content "Find a Nearby Food Truck"
  end

  scenario "User creates an account without an password" do
    visit '/'
    click_on "Sign Up"

    expect(page).to have_content "Create an Account"

    fill_in "First name", with: "Shannon"
    fill_in "Last name", with: "Paek"
    fill_in 'Email', with: "blablabla@gmail.com"
    click_on "Sign up"

    expect(page).to have_content "Password can't be blank"
    expect(page).not_to have_content "Find a Nearby Food Truck"
  end

  scenario "User creates an account without a first name" do
    visit '/'
    click_on "Sign Up"

    expect(page).to have_content "Create an Account"

    fill_in "Last name", with: "Paek"
    fill_in 'Email', with: "blablabla@gmail.com"
    fill_in 'Password', with: "blabla"
    fill_in 'Password confirmation', with: "blabla"
    click_on "Sign up"

    expect(page).to have_content "First name can't be blank"
    expect(page).not_to have_content "Find a Nearby Food Truck"
  end

  scenario "User creates an account without a last name" do
    visit '/'
    click_on "Sign Up"

    expect(page).to have_content "Create an Account"

    fill_in "First name", with: "Shannon"
    fill_in 'Email', with: "blablabla@gmail.com"
    fill_in 'Password', with: "blabla"
    fill_in 'Password confirmation', with: "blabla"
    click_on "Sign up"

    expect(page).to have_content "Last name can't be blank"
    expect(page).not_to have_content "Find a Nearby Food Truck"
  end
end
