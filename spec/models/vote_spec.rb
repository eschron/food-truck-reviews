require 'rails_helper'
RSpec.describe 'vote' do

  context 'when a vote is created' do
    it 'has a up_down' do
      user = FactoryGirl.create(:user)
      foodtruck = Truck.create(name: 'Yummy Food', description: 'The yummiest food', email: 'yummy@food.com')
      review = Review.create(rating: 3, user: user, truck: foodtruck)
      expect(Vote.new(up_down: true, user: user, review: review).up_down).to eq(true)
    end
    it 'has a user id' do
      user = FactoryGirl.create(:user)
      foodtruck = Truck.create(name: 'Yummy Food', description: 'The yummiest food', email: 'yummy@food.com')
      review = Review.create(rating: 3, user: user, truck: foodtruck)
      expect(Vote.new(up_down: true, user: user, review: review).user).to eq(user)
    end
    it 'has a truck id' do
      user = FactoryGirl.create(:user)
      foodtruck = Truck.create(name: 'Yummy Food', description: 'The yummiest food', email: 'yummy@food.com')
      review = Review.create(rating: 3, user: user, truck: foodtruck)
      expect(Vote.new(up_down: true, user: user, review: review).review).to eq(review)
    end
  end

  context 'creating vote with missing information' do
    it 'is missing up_down' do
      user = FactoryGirl.create(:user)
      foodtruck = Truck.create(name: 'Yummy Food', description: 'The yummiest food', email: 'yummy@food.com')
      review = Review.create(rating: 3, user: user, truck: foodtruck)
      Vote.create(user: user, review: review)

      expect(Vote.all.length).to eq(0)
    end
  end

end
