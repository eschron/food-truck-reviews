require 'rails_helper'
RSpec.describe 'review' do

  context 'when a review is created' do
    it 'has a rating' do
      user = FactoryGirl.create(:user)
      foodtruck = Truck.create(name: 'Yummy Food', description: 'The yummiest food', email: 'yummy@food.com')
      expect(Review.new(rating: 3, user: user, truck: foodtruck).rating).to eq(3)
    end
    it 'has a user id' do
      user = FactoryGirl.create(:user)
      foodtruck = Truck.create(name: 'Yummy Food', description: 'The yummiest food', email: 'yummy@food.com')
      expect(Review.new(rating: 3, user: user, truck: foodtruck).user).to eq(user)
    end
    it 'has a truck id' do
      user = FactoryGirl.create(:user)
      foodtruck = Truck.create(name: 'Yummy Food', description: 'The yummiest food', email: 'yummy@food.com')
      expect(Review.new(rating: 3, user: user, truck: foodtruck).truck).to eq(foodtruck)
    end
  end

  context 'creating review with missing information' do
    it 'is missing rating' do
      user = FactoryGirl.create(:user)
      foodtruck = Truck.create(name: 'Yummy Food', description: 'The yummiest food', email: 'yummy@food.com')
      Review.create(user: user, truck: foodtruck, description: 'Really great food truck')

      expect(Review.all.length).to eq(0)
    end
  end

end
