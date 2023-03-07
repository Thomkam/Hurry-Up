# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
Item.destroy_all
SittingArea.destroy_all
User.destroy_all
Restaurant.destroy_all
Category.destroy_all



riwan = User.create(email: "riwan@example.com", password: "password")
riwan.save!
thomas = User.create(email: "thomas@example.com", password: "password")
thomas.save!
benoit = User.create(email: "benoit@example.com", password: "password")
benoit.save!

restaurant1 = Restaurant.new(
  name: "Riwan's spices",
  address: "the best place",
  number_of_tables: 2
)
restaurant1.save!

  sitting_area1 = SittingArea.new(
    table_number: 1
  )
  sitting_area1.restaurant = restaurant1
  sitting_area1.save!

  sitting_area2 = SittingArea.new(
    table_number: 2
  )
  sitting_area1.restaurant = restaurant1
  sitting_area1.save!



restaurant2 = Restaurant.new(
  name: "Ben's delicacies",
  address: "the basement",
  number_of_tables: 2
)
restaurant2.save!

  sitting_area3 = SittingArea.new(
    table_number: 1
  )
  sitting_area3.restaurant = restaurant2
  sitting_area3.save!

  sitting_area4 = SittingArea.new(
    table_number: 2
  )
  sitting_area4.restaurant = restaurant2
  sitting_area4.save!



restaurant3 = Restaurant.new(
  name: "Thomas's nugs",
  address: "the far est",
  number_of_tables: 2
)
restaurant3.save!

  sitting_area5 = SittingArea.new(
    table_number: 1
  )
  sitting_area5.restaurant = restaurant3
  sitting_area5.save!

  sitting_area6 = SittingArea.new(
    table_number: 2
  )
  sitting_area6.restaurant = restaurant3
  sitting_area6.save!


category1 = Category.new(
  name: "vaisselle"
)
category1.save!

  item1 = Item.new(
    name: "verre",
    description: "",
    custom:""
  )
  item1.category = category1
  item1.save!

  item2 = Item.new(
    name: "couteau",
    description: "",
    custom:""
  )
  item2.category = category1
  item2.save!



category2 = Category.new(
  name: "sauce"
)
category2.save!

  item3 = Item.new(
    name: "mayonnaise",
    description: "ingredients: egg, mustard, oil",
    custom:""
  )
  item3.category = category2
  item3.save!

  item4 = Item.new(
    name: "ketchup",
    description: "ingredients: tomato concentrate, vinegar, corn syrup, salt, ",
    custom:""
  )
  item4.category = category2
  item4.save!
