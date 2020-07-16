# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if User.where(role: "admin").all.count == 0
  User.create(email: "bios@gmail.com", password: "12345678", password_confirmation: "12345678", role: 1)
end

if User.all.count < 5
  100.times do 
    User.create(
      email: Faker::Internet.email, 
      password: "12345678", 
      password_confirmation: "12345678"
    )
  end
end

if Product.all.count == 0
  1000.times do
    Product.create(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence(1),
      price: Faker::Commerce.price
    )
  end
end