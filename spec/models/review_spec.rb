require 'rails_helper'
RSpec.describe 'review' do

  context 'when a review is created' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @foodtruck = FactoryGirl.create(:truck)
    end

    it 'has a rating' do
      expect(Review.new(rating: 3, user: @user, truck: @foodtruck).rating).to eq(3)
    end
    it 'has a user id' do
      expect(Review.new(rating: 3, user: @user, truck: @foodtruck).user).to eq(@user)
    end
    it 'has a truck id' do
      expect(Review.new(rating: 3, user: @user, truck: @foodtruck).truck).to eq(@foodtruck)
    end
    it 'sends an email to the user' do
      ActionMailer::Base.deliveries.clear
      @user.update(email: "cbrennan31@gmail.com")
      @foodtruck.update(user: @user)
      review = Review.create(rating: 3, user: @user, truck: @foodtruck)
      ReviewMailer.new_review(review).deliver_now
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end
  end

  context 'creating review with missing information' do
    it 'is missing rating' do
      user = FactoryGirl.create(:user)
      foodtruck = FactoryGirl.create(:truck)
      Review.create(user: user, truck: foodtruck, description: 'Really great food truck')

      expect(Review.all.length).to eq(0)
    end
  end

end
