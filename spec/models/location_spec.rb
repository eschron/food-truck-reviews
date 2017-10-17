require "rails_helper"

RSpec.describe "location" do
  context "when the location is created" do
    it "has a body" do
      expect(Location.new(body: 'Back Bay').body).to eq('Back Bay')      
    end
  end

  context 'creating truck with missing information' do
    it "is missing the body" do
      location = Location.new()
      location.save

      expect(Location.all.length).to eq(0)    
    end
  end
end