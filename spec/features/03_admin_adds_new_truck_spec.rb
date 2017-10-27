require 'rails_helper'

RSpec.describe "Admin adds new truck" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    truck = FactoryGirl.create(:truck)
    @user.admin = true
    login_as(@user, :scope => :user)
    Location.create!(body: "South Station")
  end

  scenario "Admin visits new truck page" do
    visit trucks_path

    expect(page).to have_content('Add Food Truck')

    click_on "Add Food Truck"
    expect(page).to have_content("Name")
    expect(page).to have_content("Description")
    expect(page).to have_content("Location")
  end

  scenario "Admin adds new truck" do
    visit new_truck_path

    fill_in 'Name', with: "Foo"
    fill_in 'Description', with: "blabla"
    select "South Station", from: "truck_location_id"
    click_on "Submit Food Truck"

    expect(page).to have_content("Truck added successfully")
    expect(page).to have_content("Foo")
    expect(page).to have_content("blabla")
  end

  scenario "Admin unsuccessfully add new truck without name" do
    visit new_truck_path

    fill_in 'Description', with: "blabla"
    select "South Station", from: "truck_location_id"
    click_on "Submit Food Truck"

    expect(page).to have_content("Name can't be blank")
  end

  scenario "Admin unsuccessfully add new truck without description" do
    visit new_truck_path

    fill_in 'Name', with: "New name"
    select "South Station", from: "truck_location_id"
    click_on "Submit Food Truck"

    expect(page).to have_content("Description can't be blank")
  end
end
