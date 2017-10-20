require 'rails_helper'
RSpec.describe "User visits trucks index page" do
  scenario "User sees list of all trucks" do
    location = Location.create(body: "Copley Square")
    food_truck = Truck.create(
      name: 'Yummy Food',
      description: 'The yummiest food',
      email: 'yummy@food.com',
      location: location
      )

    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit trucks_path

    expect(page).to have_content('All Trucks')
    expect(page).to have_content(food_truck.name)
    expect(page).to have_content(food_truck.description)
    expect(page).to have_content(food_truck.location.body)
  end
end
