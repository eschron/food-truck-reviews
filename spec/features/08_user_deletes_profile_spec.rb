require 'rails_helper'

feature 'User deletes account' do
  scenario 'user cancels their registration' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit "/"
    click_on "Profile"
    click_on "Edit Profile"

    click_on "Cancel my account"

    expect(page).to have_content("Your account has been deleted. We hope to see you again soon!")
  end
end
