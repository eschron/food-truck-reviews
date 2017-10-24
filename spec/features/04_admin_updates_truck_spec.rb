require 'rails_helper'

RSpec.describe "Admin updates truck" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @user.admin = true
    login_as(@user, :scope => :user)

    @south_station = Location.create!(body: "South Station")
    @north_station = Location.create!(body: "North Station")
    @my_truck = FactoryGirl.create(:truck, location: @south_station)
  end

  scenario "Admin visits truck edit page" do
    visit truck_path(@my_truck)

    expect(page).to have_content("Edit Truck")

    click_on "Edit Truck"

    expect(page).to have_content("Update #{@my_truck.name}")
    expect(find_field('Name').value).to eq("Yummy Food")
    expect(find_field('Description').value).to eq("The yummiest food")
    expect(find_field('location').value).to eq(@south_station.id.to_s)
  end

  scenario "Admin updates truck" do
    visit edit_truck_path(@my_truck)

    fill_in 'Name', with: "New Name"
    fill_in 'Description', with: "New Description"
    select "North Station", from: "location"
    click_on "Update Food Truck"

    expect(page).to have_content("Truck updated successfully")

    expect(page).to have_content("New Name")
    expect(page).to have_content("New Description")
    expect(page).to have_content("North Station")
  end

  scenario "Admin unsuccessfully updates truck without name" do
    visit new_truck_path

    fill_in 'Description', with: "blabla"
    select "South Station", from: "location"
    click_on "Submit Food Truck"

    expect(page).to have_content("Name can't be blank")
  end

  scenario "Admin unsuccessfully updates truck without description" do
    visit new_truck_path

    fill_in 'Name', with: "New name"
    select "South Station", from: "location"
    click_on "Submit Food Truck"

    expect(page).to have_content("Description can't be blank")
  end
end
