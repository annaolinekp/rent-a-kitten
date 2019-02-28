# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Booking.destroy_all
Kitten.destroy_all
User.destroy_all

puts 'Creating 12 fake users...'
11.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456"

  )
  user.save!

    kitten = Kitten.new(
      name: Faker::Creature::Cat.name,
      description: Faker::Creature::Cat.breed,
      location: Faker::Address.city,
      user: user
    )
    kitten.save!

end

kitten = Kitten.new(
  name: 'Galileo',
  description: 'Maine Coon kitty',
  location: 'London',
  user: User.first,
  latitude: 103,
  longitude: 100
)
kitten.save!

puts 'Finished!'
