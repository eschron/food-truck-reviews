require 'rails_helper'
RSpec.describe 'review' do

  it 'sends an email to the user' do
    user = FactoryGirl.create(:user, email: "cbrennan31@gmail.com")
    foodtruck = FactoryGirl.create(:truck, user: user)
    review = Review.create(rating: 3, truck: foodtruck, user: user)

    ReviewMailer.new_review(review).deliver_now
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
