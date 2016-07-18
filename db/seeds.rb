# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  name = Faker::Space.moon
  brand = Faker::Space.planet
  description = Faker::Lorem.paragraph
  price = (rand(9).to_s + "000").to_i
  Product.create!(name: name,
    brand: brand,
    description: description,
    price: price)
end