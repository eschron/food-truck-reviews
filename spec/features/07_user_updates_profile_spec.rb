require 'rails_helper'

feature 'User updates account info' do
  scenario 'user changes their email, password, first name, and last name' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    truck = FactoryGirl.create(:truck)

    visit "/"
    click_on "Profile"
    click_on "Edit Profile"

    fill_in "First name", with: "Marky"
    fill_in "Last name", with: "Mark"
    fill_in "Password", with: "newpassword"
    fill_in "Password confirmation", with: "newpassword"
    fill_in "Current password", with: user.password

    click_on "Update"

    expect(page).to have_content("Your account has been updated successfully.")
    expect(page).to have_content("Marky Mark")
    expect(page).to have_content(user.email)
  end

  scenario 'user does not enter current password' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    truck = FactoryGirl.create(:truck)

    visit "/"
    click_on "Profile"
    click_on "Edit Profile"

    fill_in "Password", with: "newpassword"
    fill_in "Password confirmation", with: "newpassword"

    click_on "Update"

    expect(page).to have_content("Current password can't be blank")
    expect(page).not_to have_content("My Profile")
  end

  scenario 'user incorrectly confirms password' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    truck = FactoryGirl.create(:truck)

    visit "/"
    click_on "Profile"
    click_on "Edit Profile"

    fill_in "Password", with: "newpassword"
    fill_in "Password confirmation", with: "newpassword2"

    click_on "Update"

    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(page).not_to have_content("My Profile")
  end
end
