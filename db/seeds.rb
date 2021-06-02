# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
Car.destroy_all
# the next line allow us to clean the user db
User.destroy_all

puts 'Creating 20 fake cars...'
first_user = User.create(user_name: 'Zezin', password: '123456', email: 'ze@ninguem.com')
20.times do
  car = Car.new(
    model:    Faker::Vehicle.make_and_model,
    year:    rand(1950..2021),
    km:    rand(12_000..180_000),
    location:    "#{Faker::Address.street_address}, #{Faker::Address.city}",
    user_id: first_user.id,
  )
  car.save!
  puts "#{car.id} #{car.model}"
end
puts 'Finished!'
