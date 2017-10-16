require 'rails_helper'
RSpec.describe 'truck' do

  context 'when the truck is created' do
    it 'has a name' do
      expect(Truck.new(name: 'Yummy Food', description: 'The yummiest food', email: 'yummy@food.com').name).to eq 'Yummy Food'
    end

    it 'has a description' do
      expect(Truck.new(name: 'Yummy Food', description: 'The yummiest food', email: 'yummy@food.com').description).to eq 'The yummiest food'
    end

    it 'has an email' do
      expect(Truck.new(name: 'Yummy Food', description: 'The yummiest food', email: 'yummy@food.com').email).to eq 'yummy@food.com'
    end
  end
end
