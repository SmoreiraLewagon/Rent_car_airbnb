# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Cleaning database..."
Car.destroy_all
User.destroy_all
puts "Creating fake first user"
first_user = User.create(user_name: 'Zezin', password: '123456', email: 'ze@ninguem.com')
locations = ['Leblon, Rio de Janeiro', 'Botafogo, Rio de Janeiro', 'Humaitá, Rio de Janeiro', 'Copacabana, Rio de Janeiro', 'Arpoador, Rio de Janeiro', 'Urca, Rio de Janeiro', 'Bangu, Rio de Janeiro', 'Ipanema, Rio de Janeiro']

vehicles = [[ 'Fusca Volkswagen', 'fusca.jpg' ], [ 'Fiat uno', 'fusca.jpg' ], [ 'Volkswagen', 'fusca.jpg' ], [ 'Volkswagen', 'fusca.jpg' ],
            [ 'Volkswagen', 'fusca.jpg' ], [ 'Volkswagen', 'fusca.jpg' ], [ 'Volkswagen', 'fusca.jpg' ], [ 'Volkswagen', 'fusca.jpg' ],
            [ 'Volkswagen', 'fusca.jpg' ], [ 'Volkswagen', 'fusca.jpg' ], [ 'Volkswagen', 'fusca.jpg' ],[ 'Volkswagen', 'fusca.jpg' ],
            [ 'Volkswagen', 'fusca.jpg' ], [ 'Kombi Volkswagen', 'fusca.jpg' ], [ 'Volkswagen', 'fusca.jpg' ], [ 'Volkswagen', 'fusca.jpg' ]]
puts "Creating cars..."

car = Car.create!(model: 'fusca', picture: "bv5byyvtdpfkoabkctrw72tp7zd4", year: 2021, km: 45, location: 'Rio de Janeiro', user_id: first_user.id )


puts "Finished!"





