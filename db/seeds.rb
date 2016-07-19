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
  name = Faker::Name.name
  email = Faker::Internet.email
  User.create!(name: name, email: email,
                password: "foobar", password_confirmation: "foobar")
end

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

prod = Product.all
10.times do
  review = Faker::Lorem::paragraph(2)
  Review.create!(content: review, product_id: prod.sample.id, user_id: rand(1..9))
end