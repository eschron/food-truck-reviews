require 'rails_helper'

feature 'User signs out' do
  scenario 'User logs out of their account' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit '/'
    click_on 'Sign Out'

    expect(page).to have_content("Signed out successfully")
    expect(page).not_to have_content("Find a Nearby Food Truck")
  end
end
