# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

puts "Cleaning database..."
Rent.destroy_all
Car.destroy_all
User.destroy_all
puts "Creating fake first user"
first_user = User.create(user_name: 'Zezin', password: '123456', email: 'ze@ninguem.com')

locations = ['Botafogo, Rio de Janeiro', 'Leblon, Rio de Janeiro', 'Humaitá, Rio de Janeiro', 'Copacabana, Rio de Janeiro',
            'Ipanema, Rio de Janeiro', 'Urca, Rio de Janeiro', 'Arpoador, Rio de Janeiro' ]
models = [ 'Volkswagen Fusca', 'Chevrolet Onix ', 'Fiat Uno Elx', 'Peugeot 206', 'Volkswagen Gol',
            'Ford Ka', 'Volkswagen Kombi ', 'Ford Fiesta', 'Lambreta Li ', 'Kia Bongo']

car_images = ['https://quatrorodas.abril.com.br/wp-content/uploads/2014/02/vw-super-fuscc3a3o-1600-s-1.jpeg',
            'https://http2.mlstatic.com/D_NQ_NP_846954-MLB45640268040_042021-O.webp',
            'https://http2.mlstatic.com/D_NQ_NP_913422-MLB45779341320_052021-O.webp',
            'https://http2.mlstatic.com/D_NQ_NP_861510-MLB45704225506_042021-O.webp',
            'https://http2.mlstatic.com/D_NQ_NP_709576-MLB45797530978_052021-O.webp',
            'https://http2.mlstatic.com/D_NQ_NP_663421-MLB46204553530_052021-O.webp',
            'https://s2.glbimg.com/lZ06g62IS67hm_VvbL0J5PJdrus=/0x0:620x413/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2020/B/S/FghADFTnuKeaPVLVAtFw/2020-03-19-volkswagen-e-bulli-concept-2020-1600-02.jpg',
            'https://http2.mlstatic.com/D_NQ_NP_813429-MLB43928609919_102020-O.webp',
            'https://http2.mlstatic.com/D_NQ_NP_982159-MLB45641376497_042021-O.webp',
            'https://http2.mlstatic.com/D_NQ_NP_927856-MLB45855074197_052021-O.webp']


puts "Creating fake cars"
puts "It takes some time. Calm down..."
count = 0
models.each do |element|
    car = Car.create!(model: element, year: rand(1990..2021), km: rand(50000..250000), location: locations.sample, daily_rate: rand(9..25), user_id: first_user.id )
    file = open(car_images[count])
    car.picture.attach(io: file, filename: 'some-image.jpg')
    count +=1
end


puts "Finished!"





