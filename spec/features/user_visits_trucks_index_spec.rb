require 'rails_helper'
RSpec.describe "User visits trucks index page" do
  scenario "User sees list of all trucks" do
    food_truck = Truck.create(name: 'Yummy Food', description: 'The yummiest food', email: 'yummy@food.com')

    visit trucks_path

    expect(page).to have_content('All Trucks')
    expect(page).to have_content(food_truck.name)
    expect(page).to have_content(food_truck.description)
  end
end
