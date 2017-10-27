require 'rails_helper'
RSpec.describe "User visits trucks index page" do
  scenario "User sees list of all trucks" do
    location = Location.create!(body: "Copley Square")
    food_truck = FactoryGirl.create(:truck, location: location)

    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    truck = FactoryGirl.create(:truck)

    visit trucks_path

    expect(page).to have_content('All Trucks')
    expect(page).to have_content(food_truck.name)
    expect(page).to have_content(food_truck.description)
  end
end
