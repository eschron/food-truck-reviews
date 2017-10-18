require 'rails_helper'

RSpec.describe "Admin adds new truck" do
  scenario "Admin visits new truck page" do
    visit trucks_path

    expect(page).to have_content('Add Food Truck')

    click "Add Food Truck"
    expect(page).to have_content("Name")
    expect(page).to have_content("Description")
    expect(page).to have_content("Email")
    expect(page).to have_content("Location")
    expect(page).to have_content("Submit Food Truck")
  end
end
