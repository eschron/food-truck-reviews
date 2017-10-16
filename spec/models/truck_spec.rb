require 'rails_helper'
RSpec.describe 'truck' do
  scenario 'Adds a truck' do
    food_truck = Truck.new(name: 'Yummy Food', description: 'The yummiest food', email: 'yummy@food.com')
    food_truck.save

    expect(Truck.all.length).to eq(1)
  end
  scenario 'destroy a truck' do
    food_truck = Truck.new(name: 'Yummy Food', description: 'The yummiest food', email: 'yummy@food.com')
    food_truck.save
    food_truck.destroy

    expect(Truck.all.length).to eq(0)
  end
  scenario 'edit a truck' do
    food_truck = Truck.new(name: 'Yummy Food', description: 'The yummiest food', email: 'yummy@food.com')
    food_truck.save
    food_truck.name = 'Gross Food'

    expect(food_truck.name).to eq('Gross Food')
  end
end
