require 'rails_helper'
RSpec.describe "Owner adds food truck" do
  before(:each) do
    user = FactoryGirl.create(:user, truck_owner: true)
    login_as(user, :scope => :user)
    Location.create!(body: "South Station")
    truck = FactoryGirl.create(:truck)
  end

  scenario "User sees list of all trucks" do
    visit trucks_path
    click_on "Add Food Truck"

    fill_in 'Name', with: "Foo"
    fill_in 'Description', with: "blabla"
    select "South Station", from: "truck_location_id"
    click_on "Submit Food Truck"

    expect(page).to have_content("Truck added successfully")
    expect(page).to have_content("Foo")
    expect(page).to have_content("blabla")
  end

  scenario "Truck owner unsuccessfully add new truck without name" do
    visit new_truck_path

    fill_in 'Description', with: "blabla"
    select "South Station", from: "truck_location_id"
    click_on "Submit Food Truck"

    expect(page).to have_content("Name can't be blank")
  end

  scenario "Truck owner unsuccessfully add new truck without description" do
    visit new_truck_path

    fill_in 'Name', with: "New name"
    select "South Station", from: "truck_location_id"
    click_on "Submit Food Truck"

    expect(page).to have_content("Description can't be blank")
  end
end
