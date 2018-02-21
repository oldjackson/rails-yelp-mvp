# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

names = ["Pita Express Kitchen Inc.","Nick's Seabreeze Inn","Tuckahoe H.s.","El Coqui Family Rest.","Club Purgatory"]
categories = ["chinese", "italian", "japanese", "french", "belgian"]

names.each do |name|
  reviews = []
  rand(5..10).times do
    reviews << Review.new(
      content: Faker::Lorem.sentence,
      rating: (0..5).to_a.sample
    )
  end
  restaurant = Restaurant.new(
    name: name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city} - #{Faker::Address.country}",
    phone_number: Faker::PhoneNumber.phone_number,
    category: categories.sample,
    reviews: reviews
  )
  restaurant.save!
end
