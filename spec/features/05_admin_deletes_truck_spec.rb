require 'rails_helper'

RSpec.describe "Admin deletes truck" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @user.admin = true
    login_as(@user, :scope => :user)

    @south_station = Location.create(body: "South Station")
    @my_truck = FactoryGirl.create(:truck, location: @south_station)
  end

  scenario "Admin visits truck edit page" do
    visit edit_truck_path(@my_truck)

    click_on "delete"

    expect(page).to have_content("All Trucks")
    expect(page).to have_content("Food Truck successfully deleted")
  end
end
