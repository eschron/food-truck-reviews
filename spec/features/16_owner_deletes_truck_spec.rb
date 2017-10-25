require 'rails_helper'

RSpec.describe "Owner deletes truck" do
  before(:each) do
    user = FactoryGirl.create(:user, truck_owner: true)
    login_as(user, :scope => :user)

    @south_station = Location.create!(body: "South Station")
    @my_truck = FactoryGirl.create(:truck, location: @south_station, user: user)
  end

  scenario "Owner deletes truck" do
    visit edit_truck_path(@my_truck)
    truck_id = @my_truck.id

    click_on "delete"

    expect(page).to have_content("All Trucks")
    expect(page).to have_content("Food Truck successfully deleted")
    expect(Review.where(truck_id: truck_id).length).to eq(0)
  end
end
