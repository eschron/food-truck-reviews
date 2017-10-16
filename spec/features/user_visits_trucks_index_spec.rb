require 'rails_helper'
RSpec.describe "User visits trucks index page" do
  scenario "User sees list of all trucks" do
    foodTruck = Truck.create(name: 'Yummy Food', description: 'The yummiest food', email: 'yummy@food.com')

    visit trucks_path

    expect(page).to have_content('All Trucks')
    expect(page).to have_content(foodTruck.name)
    expect(page).to have_content(foodTruck.description)
  end
end
