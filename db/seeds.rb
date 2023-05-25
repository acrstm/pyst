# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts 'Creating 30 Basic products...'
10.times do
  product = Product.new(
    name: Faker::Food.fruits,
    price: rand(0.1..4.0)
  )
  product.save!
end

10.times do
  product = Product.new(
    name: Faker::Food.vegetables,
    price: rand(0.1..5.0)
  )
  product.save!
end

10.times do
  product = Product.new(
    name: Faker::Food.spice,
    price: rand(0.1..4.5)
  )
  product.save!
end
puts 'Finished!'
