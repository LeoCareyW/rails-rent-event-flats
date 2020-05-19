# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "cleaning DB"

Flat.destroy_all
User.destroy_all

puts "creating a flat"


user1 = User.create!(
  email: "mikey@gmail.com",
  password: "123456",
  password_confirmation: "123456")

newflat = Flat.new(
  name: "Nice Party House",
  address: "A good location",
  description: "It's fun",
  price: 10)

newbooking = Booking.new(
  start_date: 100,
  end_date: 102)

newflat.user = user1
newbooking.flat = newflat
newbooking.user = user1
newflat.save
newbooking.save

puts "done"
puts newflat


