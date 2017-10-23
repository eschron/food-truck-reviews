require 'rails_helper'
RSpec.describe 'truck' do

  context 'when the truck is created' do
    it 'has a name' do
      expect(FactoryGirl.create(:truck).name).to eq 'Yummy Food'
    end

    it 'has a description' do
      expect(FactoryGirl.create(:truck).description).to eq 'The yummiest food'
    end


    it 'has a user' do
      truck = FactoryGirl.create(:truck)
      expect(truck.user).to be_truthy
    end
  end

  context 'creating truck with missing information' do
    it 'is missing name' do
      foodtruck = FactoryGirl.build(:truck, name: nil)
      foodtruck.save

      expect(Truck.all.length).to eq(0)
    end

    it 'is missing description' do
      foodtruck = FactoryGirl.build(:truck, description: nil)
      foodtruck.save

      expect(Truck.all.length).to eq(0)
    end

    it 'is missing email' do
      foodtruck = FactoryGirl.build(:truck, user: nil)
      foodtruck.save

      expect(Truck.all.length).to eq(0)
    end
  end
end
