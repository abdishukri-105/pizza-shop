# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
restaurant_names = [
    "Pizzeria Uno",
    "Pizza Hut",
    "Domino's Pizza",
    "Little Caesars",
    "Papa John's",
    "Marco's Pizza",
    "California Pizza Kitchen",
    "Pizza Ranch",
    "Chuck E. Cheese's",
    "Round Table Pizza",
    "Godfather's Pizza",
    "Pizza Patron",
    "Blaze Pizza",
    "MOD Pizza",
    "Pieology"
  ]
  
  pizza_names = [
    "Pepperoni",
    "Margarita",
    "Hawaiian",
    "Meat Lovers",
    "Veggie",
    "BBQ Chicken",
    "Supreme",
    "Buffalo Chicken",
    "Four Cheese",
    "Pesto",
    "White",
    "Chicago Style",
    "New York Style",
    "Neapolitan",
    "Sicilian"
  ]
  
  pizza_ingredients = [
    "tomatoes",
    "mozzarella cheese",
    "pepperoni",
    "ham",
    "pineapple",
    "green peppers",
    "onions",
    "mushrooms",
    "olives",
    "sausage",
    "bacon",
    "chicken",
    "BBQ sauce",
    "buffalo sauce",
    "blue cheese",
    "cheddar cheese",
    "feta cheese",
    "ricotta cheese",
    "basil",
    "garlic",
    "olive oil"
  ]
  
  restaurant_names.each do |name|
    address = "#{rand(1000..9999)} #{Faker::Address.street_name}"
    restaurant = Restaurant.create(name: name, address: address)
  
    2.times do
      pizza_name = pizza_names.sample
      pizza_ingredient = pizza_ingredients.sample
      pizza = Pizza.create(name: pizza_name, ingredient: pizza_ingredient)
      restaurant.restaurant_pizzas.create(pizza: pizza, price: rand(1..30))
    end

  end
  
