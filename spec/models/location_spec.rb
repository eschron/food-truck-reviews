require "rails_helper"

RSpec.describe "location" do
  scenario "add a new location" do
    back_bay = Location.new(body: 'Back Bay')
    back_bay.save

    expect(Location.all.length).to eq(1)
  end
  scenario "edits a location" do
    back_bay = Location.new(body: 'Back Bay')
    back_bay.save
    back_bay.body = 'Not Back Bay'

    expect(back_bay.body).to eq('Not Back Bay')
  end
  scenario "destroys a location" do
    back_bay = Location.new(body: 'Back Bay')
    back_bay.save
    back_bay.destroy

    expect(Location.all.length).to eq(0)
  end
end