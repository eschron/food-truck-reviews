require 'rails_helper'
RSpec.describe "User visits trucks search page" do
  before(:each) do
    copley = Location.create(body: "Copley Square")
    back_bay = Location.create(body: "Back Bay")
    mexican = Category.create(cuisine: "Mexican")
    asian = Category.create(cuisine: "Asian")
    yummy = Truck.create(
      name: "Yummy Food",
      description: "This is delicious",
      user: FactoryGirl.create(:user),
      location: back_bay
    )
    mexican_truck = Truck.create(
      name: "Mexican Truck",
      description: "This is also delicious",
      user: FactoryGirl.create(:user),
      location: copley
    )
    Categorization.create(truck: yummy, category: asian)
    Categorization.create(truck: mexican_truck, category: mexican)

    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end

  scenario "User accesses truck search page from home page" do
    visit "/"
    click_on "Search All Trucks"

    expect(page).to have_content('Search Trucks')
  end

  scenario "User visits search page and sees list of food trucks" do
    visit search_path

    expect(page).to have_link("Mexican Truck")
    expect(page).to have_link("Yummy Food")
  end

  scenario "User searches for a truck by part of its name" do
    visit search_path

    fill_in "search", with: "yummy"
    click_on "Search"

    expect(page).to have_link('Yummy Food')
  end

  scenario "User searches for a truck by its location" do
    visit search_path

    select "Copley", from: "location_id"
    click_on "Search"

    expect(page).to have_content("Copley")
  end

  scenario "User searches for a truck by its category" do
    visit search_path

    choose "Mexican"
    click_on "Search"

    expect(page).to have_link("Mexican Truck")
  end

  scenario "User searches for a truck by name and location" do
    visit search_path

    fill_in "search", with: "yummy"
    select "Back Bay", from: "location_id"
    click_on "Search"

    expect(page).to have_link("Yummy Food")
    expect(page).not_to have_link("Mexican Truck")
  end

  scenario "User searches for a truck by name and category" do
    visit search_path

    fill_in "search", with: "mexican"
    choose "Mexican"
    click_on "Search"

    expect(page).to have_link("Mexican Truck")
    expect(page).not_to have_link("Yummy Food")
  end

  scenario "User searches for a truck by location and category" do
    visit search_path

    select "Copley", from: "location_id"
    choose "Mexican"
    click_on "Search"

    expect(page).to have_link("Mexican Truck")
    expect(page).not_to have_link("Yummy Food")
  end

  scenario "User search for a truck by location, category, and name" do
    visit search_path

    fill_in "search", with: "yummy"
    select "Back Bay", from: "location_id"
    choose "Asian"
    click_on "Search"

    expect(page).to have_link("Yummy Food")
    expect(page).not_to have_link("Mexican Truck")
  end

  scenario "User searches for a truck that does not exist" do
    visit search_path

    fill_in "search", with: "yummy"
    select "Copley", from: "location_id"
    choose "Mexican"
    click_on "Search"

    expect(page).to have_content("No trucks match this search")
    expect(page).not_to have_link("Mexican Truck")
    expect(page).not_to have_link("Yummy Food")
  end

  scenario "User selects a truck listed in the results to view more details" do
    visit search_path

    fill_in "search", with: "yummy"
    click_on "Search"
    click_on "Yummy Food"

    expect(page).to have_content("Description: This is delicious")
  end
end
