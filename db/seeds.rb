# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

south_station = Location.create!(body: "South Station")
back_bay = Location.create!(body: "Back Bay")
south_end = Location.create!(body: "South End")
north_end = Location.create!(body: "North End")
fenway = Location.create!(body: "Fenway")

mexican = Category.create!(cuisine: "Mexican")
vegetarian = Category.create!(cuisine: "Vegetarian")
vietnamese = Category.create!(cuisine: "Vietnamese")
sandwiches = Category.create!(cuisine: "Sandwiches")
indian = Category.create!(cuisine: "Indian")

yolanda = User.create!(first_name: "Yolanda",
  last_name: "Garcia",
  email: "foodtruckowner@gmail.com",
  password: "blabla",
  admin: false,
  truck_owner: true,
  )
# this is food truck owner for the walkthrough

maggie = User.create!(first_name: "Maggie",
  last_name: "Martin",
  email: "foodtruckowner2@gmail.com",
  password: "blabla",
  admin: true,
  truck_owner: true
  )
# this is our admin for the walkthrough

bob_loblaw = User.create!(first_name: "Bob",
  last_name: "Loblaw",
  email: "robertloblaw1234@gmail.com",
  password: "blabla",
  admin: false,
  truck_owner: false,
  )
# this is our sample user for the walkthrough

marvin = User.create!(first_name: "Marvin",
  last_name: "Martian",
  email: "marvinthemartian1234@gmail.com",
  password: "blabla",
  admin: false,
  truck_owner: false
  )

allison = User.create!(first_name: "Allison",
  last_name: "Doe",
  email: "foodtruckuser@gmail.com",
  password: "blabla",
  admin: false,
  truck_owner: true
)

allison2 = User.create!(first_name: "Allison",
  last_name: "Doe",
  email: "foodtruckuser2@gmail.com",
  password: "blabla",
  admin: false,
  truck_owner: true
)

allison3 = User.create!(first_name: "Allison",
  last_name: "Doe",
  email: "foodtruckuser3@gmail.com",
  password: "blabla",
  admin: false,
  truck_owner: true
)

allison4 = User.create!(first_name: "Allison",
  last_name: "Doe",
  email: "foodtruckuser4@gmail.com",
  password: "blabla",
  admin: false,
  truck_owner: true
)

allison5 = User.create!(first_name: "Allison",
  last_name: "Doe",
  email: "foodtruckuser5@gmail.com",
  password: "blabla",
  admin: false,
  truck_owner: true
)

allison6 = User.create!(first_name: "Allison",
  last_name: "Doe",
  email: "foodtruckuser6@gmail.com",
  password: "blabla",
  admin: false,
  truck_owner: true
)

allison7 = User.create!(first_name: "Allison",
  last_name: "Doe",
  email: "foodtruckuser7@gmail.com",
  password: "blabla",
  admin: false,
  truck_owner: true
)

allison8 = User.create!(first_name: "Allison",
  last_name: "Doe",
  email: "foodtruckuser8@gmail.com",
  password: "blabla",
  admin: false,
  truck_owner: true
)

allison9 = User.create!(first_name: "Allison",
  last_name: "Doe",
  email: "foodtruckuser9@gmail.com",
  password: "blabla",
  admin: false,
  truck_owner: true
)

yolandas_taqueria = Truck.create!(
  name: "Yolanda\'s Taqueria",
  location: south_station,
  description: "Serving up tacos, burritos, quesadillas, and our ever-popular churros.",
  user: yolanda)

Categorization.create(category: mexican, truck: yolandas_taqueria)

# Review.create(rating: 5, description: "I tried the burrito with carnitas and guac and it was SO GOOD. 10/10 will be back soon!", truck: yolandas_taqueria, user: bob_loblaw)
# This is our example review

three_stars = Review.create(rating: 3, description: "The churros were in fact delicious. The line was pretty long, though. Food was good but hard to fit into my lunch break!", truck: yolandas_taqueria, user: maggie)
Vote.create(user: allison, review: three_stars, up_down: true)

Review.create(rating: 4, description: "The chicken quesadilla was tasty and filling. Good deal for the price!", truck: yolandas_taqueria, user: marvin)

Review.create(rating: 4, description: "Really good burrito bowls. Super convenient location right next to South Station.", truck: yolandas_taqueria, user: allison)

tortas_togo = Truck.create!(
  name: "Tortas To-Go",
  location: back_bay,
  description: "Delicious cold and hot Mexican sandwiches. Try out our famous torta de aguacate with avocado!" ,
  user: allison)

Categorization.create(category: mexican, truck: tortas_togo)

carrot_stix = Truck.create!(
  name: "Carrot Stix",
  location: south_end,
  description: "More than just carrots! Locally-sourced organic everything. Serving salad, soups, and lots of seitan!",
  user: allison2)

Categorization.create(category: vegetarian, truck: carrot_stix)

terrific_tofu = Truck.create!(
  name: "Terrific Tofu",
  location: north_end,
  description: "Creative tofu and grain bowls with fresh produce. Check out our rotating seasonal specials!" ,
  user: allison3)

Categorization.create(category: vegetarian, truck: terrific_tofu)

banh_mi_boston = Truck.create!(
  name: "Banh Mi Boston",
  location: fenway,
  description: "Our tasty Vietnamese sandwiches come with your choice of chicken, pork belly, or tofu. Stop by our new Fenway location!",
  user: allison4)

Categorization.create(category: vietnamese, truck: banh_mi_boston)

basil_rice = Truck.create!(
  name: "Basil Rice",
  location: south_station,
  description: "Modern take on classic Vietnamese noodle and rice dishes. Delicious, healthy lunches for under $8!",
  user: allison5)

Categorization.create(category: vietnamese, truck: basil_rice)

bacon_belly = Truck.create!(
  name: "Bacon Belly",
  location: back_bay,
  description: "You can never have too much bacon! We serve other things too. But mostly bacon.",
  user: allison6)

Categorization.create(category: sandwiches, truck: bacon_belly)

cheddar_weather = Truck.create!(
  name: "Cheddar Weather",
  location: south_end,
  description: "Artisanal grilled cheese sandwiches and fancy french fries. When it comes to cheddar, there ain\'t no better!",
  user: allison7)

Categorization.create(category: sandwiches, truck: cheddar_weather)

curry_king = Truck.create!(
  name: "Curry King",
  location: north_end,
  description: "We\'re known for our chicken and lamb curries and our amazing naan. New menu additions every month.",
  user: allison8)

Categorization.create(category: indian, truck: curry_king)

super_samosa = Truck.create!(
  name: "Super Samosa",
  location: fenway,
  description: "Samosas, pakoras, and more classic Indian street food, served with our famous homemade mint chutney.",
  user: allison9)

Categorization.create(category: indian, truck: super_samosa)
