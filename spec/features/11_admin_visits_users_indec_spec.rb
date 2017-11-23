require 'rails_helper'
RSpec.describe "Admin visits users index page" do

  scenario "Admin sees list of all users" do
    admin = FactoryGirl.create(:user)
    user = FactoryGirl.create(:user, email: 'test@test.com')
    admin.update(admin: true)
    login_as(admin, :scope => :user)
    truck = FactoryGirl.create(:truck)

    visit users_path

    expect(page).to have_content('All Users')
    expect(page).to have_content(user.email)
    expect(page).to have_content(admin.email)
  end

  scenario "User tries to see users index, redirected" do
    admin = FactoryGirl.create(:user)
    user = FactoryGirl.create(:user, email: 'test@test.com')
    admin.update(admin: true)
    login_as(user, :scope => :user)
    truck = FactoryGirl.create(:truck)

    visit users_path

    expect(page).to have_content('All Trucks')
  end

  scenario "Admin deletes user" do
    admin = FactoryGirl.create(:user)
    user = FactoryGirl.create(:user, email: 'test@test.com')
    admin.update(admin: true)
    login_as(admin, :scope => :user)

    visit users_path
    click_on 'Delete'

    expect(User.all.length).to eq(1)
  end
end
