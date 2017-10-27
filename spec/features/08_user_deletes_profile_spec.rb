require 'rails_helper'

feature 'User deletes account' do
  scenario 'user cancels their registration' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    truck = FactoryGirl.create(:truck)

    visit "/"
    name = "#{user.first_name} #{user.last_name}"
    click_on name
    click_on "Edit Profile"

    click_on "Cancel my account"

    expect(page).to have_content("Your account has been deleted. We hope to see you again soon!")
  end
end
