require 'rails_helper'

feature 'User updates account info' do
  scenario 'user changes their email and password' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit "/"
    click_on "Edit Profile"

    fill_in "Password", with: "newpassword"
    fill_in "Password confirmation", with: "newpassword"
    fill_in "Current password", with: user.password

    click_on "Update"

    expect(page).to have_content("Your account has been updated successfully.")
    expect(page).to have_content("My Profile")
    expect(page).to have_content(user.email)
  end
end
