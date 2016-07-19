# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create!(name: "Watches")
Category.create!(name: "Laptops")
Category.create!(name: "Phones")
Category.create!(name: "Footwear")
cat = Category.all

10.times do
  name = Faker::Space.moon
  brand = Faker::Space.planet
  description = Faker::Lorem.paragraph
  price = (rand(9).to_s + "000").to_i
  category = cat.sample
  units = rand(50)
  Product.create!(name: name,
    brand: brand,
    description: description,
    price: price,
    category_id: category.id,
    units: units)
end