require 'rails_helper'

RSpec.describe "Admin adds new truck" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @user.admin = true
    login_as(@user, :scope => :user)
    Location.create(body: "South Station")
  end

  scenario "Admin visits new truck page" do
    visit trucks_path

    expect(page).to have_content('Add Food Truck')

    click_on "Add Food Truck"
    expect(page).to have_content("Name")
    expect(page).to have_content("Description")
    expect(page).to have_content("Email")
    expect(page).to have_content("Location")
  end

  scenario "Admin adds new truck" do
    visit new_truck_path

    fill_in 'Name', with: "Foo"
    fill_in 'Description', with: "blabla"
    fill_in 'Email', with: "shirin.hunold@gmail.com"
    select "South Station", from: "location", visible: false
    click_on "Submit Food Truck"

    expect(page).to have_content("Truck added successfully")
    expect(page).to have_content("Foo")
    expect(page).to have_content("blabla")
  end

end
