# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Location.create!(body: "South Station")
Location.create!(body: "Back Bay")
Location.create!(body: "South End")
Location.create!(body: "North End")
fenway = Location.create!(body: "Fenway")
allston = Location.create!(body: "Allston")
user = User.new(email: 'j@j.gojjj', password: 'pwasdfasdfasf')

fenway_truck = Truck.create!(location: fenway, description: 'truck in fenway', email: "ertrewtrew@gmail.com", name: "Great Food Truck")
Review.create!(user: user, description: 'this was a delicious sandwich', rating: 4, truck: fenway_truck) 
