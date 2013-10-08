# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
User.create(name: "seth", password: "password")
User.create(name: "james")
User.create(name: "cat")
User.create(name: "Totoro")

Garden.create(name: "My Garden", user_id: 1, location: "Park Slope")
Garden.create(name: "Community Garden", user_id: 2, location: "the Bronx")

GardenMembership.create(user_id: 1, garden_id: 2)
GardenMembership.create(user_id: 2, garden_id: 1)
GardenMembership.create(user_id: 3, garden_id: 1)
GardenMembership.create(user_id: 4, garden_id: 1)

Crop.create(name: "Tomato", variant: "Pink Ponderosa", garden_id: 1)
Crop.create(name: "Tomato", variant: "Pink Ponderosa", garden_id: 2)
Crop.create(name: "Tomato", variant: "Green Zebra", garden_id: 1)
Crop.create(name: "Tomato", variant: "Mortgage Lifter", garden_id: 1)
Crop.create(name: "Kale", variant: "Dinosaur", garden_id: 1)
Crop.create(name: "Kale", variant: "Dinosaur", garden_id: 2)
Crop.create(name: "Beets", variant: "Yellow", garden_id: 1)
Crop.create(name: "Swiss Chard", variant: "My First Try", garden_id: 1)

Note.create(user_id: 1, crop_id: 1, title: "New Plants", text: "These look great - Hope they do well")
Note.create(user_id: 1, crop_id: 4, title: "Problems", text: "Leaves are yellowing. Overwatering?")
Note.create(user_id: 1, crop_id: 4, title: "It worked!", text: "Looking better. Need food.")
Note.create(user_id: 1, crop_id: 7, title: "Harvest Time!", text: "So delicious!")