require 'open-uri'

Order.destroy_all
Item.destroy_all
SittingArea.destroy_all
User.destroy_all
Restaurant.destroy_all
Category.destroy_all

# CREATE USER

riwan = User.create(email: "riwan@example.com", password: "password")
riwan.save!
thomas = User.create(email: "thomas@example.com", password: "password")
thomas.save!
benoit = User.create(email: "benoit@example.com", password: "password")
benoit.save!

# CREATE CATEGORY AND ITEMS

category1 = Category.new(name: "couverts")
category1.save!

itemcouverts1 = Item.new(name: "fourchette",description: "",custom:"")
itemcouverts1.category = category1
itemcouverts1.save!

itemcouverts2 = Item.new(name: "couteau à beurre",description: "",custom:"")
itemcouverts2.category = category1
itemcouverts2.save!

itemcouverts3 = Item.new(name: "couteau à viande",description: "",custom:"")
itemcouverts3.category = category1
itemcouverts3.save!

itemcouverts4 = Item.new(name: "cuillère à soupe ",description: "",custom:"")
itemcouverts4.category = category1
itemcouverts4.save!

itemcouverts5 = Item.new(name: "cuillère à café",description: "",custom:"")
itemcouverts5.category = category1
itemcouverts5.save!

category2 = Category.new(name: "sauce")
category2.save!

itemsauce1 = Item.new(name: "mayonnaise",description: "ingredients: oeuf, moutarde, huile",custom:"")
itemsauce1.category = category2
itemsauce1.save!

itemsauce2 = Item.new(name: "ketchup",description: "ingredients: tomato concentrate, vinegar, corn syrup, salt, ",custom:"")
itemsauce2.category = category2
itemsauce2.save!

itemsauce3 = Item.new(name: "sauce aux poivres",description: "ingredients:  peppercorns, heavy cream ",custom:"")
itemsauce3.category = category2
itemsauce3.save!

itemsauce4 = Item.new(name: "moutarde",description: "graines de moutarde, eau, vinaigre ",custom:"")
itemsauce4.category = category2
itemsauce4.save!

category3 = Category.new(name: "condiments")
category3.save!

itemcondiments1 = Item.new(name: "sel",description: "",custom:"")
itemcondiments1.category = category3
itemcondiments1.save!

itemcondiments2 = Item.new(name: "poivre",description: "",custom:"")
itemcondiments2.category = category3
itemcondiments2.save!

itemcondiments3 = Item.new(name: "pain",description: "",custom:"")
itemcondiments3.category = category3
itemcondiments3.save!

itemcondiments4 = Item.new(name: "vinaigre",description: "",custom:"")
itemcondiments4.category = category3
itemcondiments4.save!

category4 = Category.new(name: "serviettes")
category4.save!

itemserviettes1 = Item.new(name: "serviette en tissus",description: "",custom:"")
itemserviettes1.category = category4
itemserviettes1.save!

itemserviettes2 = Item.new(name: "serviette en papier",description: "",custom:"")
itemserviettes2.category = category4
itemserviettes2.save!

category5 = Category.new(name: "verres")
category5.save!

itemverres1 = Item.new(name: "verre à eau",description: "",custom:"")
itemverres1.category = category5
itemverres1.save!

itemverres2 = Item.new(name: "verre à vin",description: "",custom:"")
itemverres2.category = category5
itemverres2.save!

itemverres3 = Item.new(name: "flute à champagne",description: "",custom:"")
itemverres3.category = category5
itemverres3.save!

# CREATE RESTAURANT AND SITTING AREA

restaurant1 = Restaurant.new(name: "Riwan's spices",address: "the best place",number_of_sitting_areas: 2)

file = URI.open("https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80")
restaurant1.image.attach(io: file, filename: "nes.png", content_type: "image/png")
restaurant1.save!

sitting_area1 = SittingArea.new(sitting_area_number: 1)
sitting_area1.restaurant = restaurant1
sitting_area1.save!

sitting_area2 = SittingArea.new(sitting_area_number: 2)
sitting_area2.restaurant = restaurant1
sitting_area2.save!

restaurant2 = Restaurant.new(name: "Ben's delicacies",address: "the basement",number_of_sitting_areas: 2)

file = URI.open("https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80")
restaurant2.image.attach(io: file, filename: "nes.png", content_type: "image/png")
restaurant2.save!

sitting_area3 = SittingArea.new(sitting_area_number: 1)
sitting_area3.restaurant = restaurant2
sitting_area3.save!

sitting_area4 = SittingArea.new(sitting_area_number: 2)
sitting_area4.restaurant = restaurant2
sitting_area4.save!

restaurant3 = Restaurant.new(name: "Thomas's nugs",address: "the far est",number_of_sitting_areas: 2)
file = URI.open("https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=780&q=80")
restaurant3.image.attach(io: file, filename: "nes.png", content_type: "image/png")
restaurant3.save!

sitting_area5 = SittingArea.new(sitting_area_number: 1)
sitting_area5.restaurant = restaurant3
sitting_area5.save!

sitting_area6 = SittingArea.new(sitting_area_number: 2)
sitting_area6.restaurant = restaurant3
sitting_area6.save!

# CREATE ORDERS

order1 = Order.new(quantity: 2 ,status: "accepter", employee: User.first.id)
order1.item = itemcouverts1
order1.sitting_area = sitting_area1
order1.save!

order2 = Order.new(quantity: 1 ,status: "refuser", employee: User.first.id)
order2.item = itemsauce1
order2.sitting_area = sitting_area1
order2.save!

riwan.restaurant = restaurant1
riwan.save!
thomas.restaurant = restaurant2
thomas.save!
benoit.restaurant = restaurant3
benoit.save!

order3 = Order.new(quantity: 2 ,status: "en attente")
order3.item = itemsauce2
order3.sitting_area = sitting_area1
order3.save!

order4 = Order.new(quantity: 2 ,status: "accepter", employee: User.first.id)
order4.item = itemcouverts1
order4.sitting_area = sitting_area4
order4.save!

order5 = Order.new(quantity: 1 ,status: "refuser", employee: User.first.id)
order5.item = itemsauce1
order5.sitting_area = sitting_area4
order5.save!

order6 = Order.new(quantity: 2 ,status: "en attente")
order6.item = itemsauce2
order6.sitting_area = sitting_area4
order6.save!

order7 = Order.new(quantity: 2 ,status: "accepter", employee: User.first.id)
order7.item = itemcouverts1
order7.sitting_area = sitting_area6
order7.save!

order8 = Order.new(quantity: 1 ,status: "refuser", employee: User.first.id)
order8.item = itemsauce1
order8.sitting_area = sitting_area6
order8.save!

order9 = Order.new(quantity: 2 ,status: "en attente")
order9.item = itemsauce2
order9.sitting_area = sitting_area6
order9.save!
