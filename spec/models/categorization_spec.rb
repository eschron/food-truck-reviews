require 'rails_helper'
# require_relative "../app/models/truck"
# require_relative "../app/models/category"
# require_relative "../app/models/categorization"

RSpec.describe 'categorization' do
  context 'Create an association between category and food truck' do
    it 'has both truck and category info' do
      cat = Category.create(cuisine: 'Mexican')
      location = Location.create(body: "Copley Square")
      foodtruck = Truck.create(
        name: 'Yummy Food',
        description: 'The yummiest food',
        email: 'yummy@food.com',
        location: location
      )

      Categorization.create(truck: foodtruck, category: cat)

      expect(Categorization.all.length).to eq(1)
      expect(Categorization.first.truck).to eq(foodtruck)
      expect(Categorization.first.category).to eq(cat)
    end
  end
end
