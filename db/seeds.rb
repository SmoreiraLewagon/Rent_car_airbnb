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
models = [ 'Volkswagen Fusca', 'Chevrolet Red Onix ', 'Fiat Uno Elx', 'Peugeot 206', 'Honda Civic',
            'Porshe Taycan', 'Volkswagen Kombi ', 'Ferrari F12', 'Lambreta Li ', 'Kia Bongo',
            'Chevrolet Traker', 'Fiat SUV', 'Fiat Argo', 'Hyundai Creta', 'Hyundai HB20', 'Jeep REnegade']

car_images = ['https://quatrorodas.abril.com.br/wp-content/uploads/2014/02/vw-super-fuscc3a3o-1600-s-1.jpeg',
            'https://http2.mlstatic.com/D_NQ_NP_846954-MLB45640268040_042021-O.webp',
            'https://http2.mlstatic.com/D_NQ_NP_913422-MLB45779341320_052021-O.webp',
            'https://http2.mlstatic.com/D_NQ_NP_861510-MLB45704225506_042021-O.webp',
            'https://www.revistafullpower.com.br/wp-content/uploads/2020/11/ci01.jpg',
            'https://cdn-motorshow-ssl.akamaized.net/wp-content/uploads/sites/2/2020/07/pbr20_0068_fine.jpg',
            'https://s2.glbimg.com/lZ06g62IS67hm_VvbL0J5PJdrus=/0x0:620x413/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2020/B/S/FghADFTnuKeaPVLVAtFw/2020-03-19-volkswagen-e-bulli-concept-2020-1600-02.jpg',
            'https://s2.glbimg.com/1ZfjKbPhwmMVFeJzVHKFwRCWX2Q=/0x0:620x400/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2020/Z/W/S6TDHHTmaxBJK7OB3A5g/2015-07-27-ferrarif12berlinetta-4541-3.jpg',
            'https://http2.mlstatic.com/D_NQ_NP_982159-MLB45641376497_042021-O.webp',
            'https://http2.mlstatic.com/D_NQ_NP_927856-MLB45855074197_052021-O.webp',
            'https://s2.glbimg.com/mYgwlPa7vtIiUk6kROUxJUi2yyo=/0x0:620x413/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2020/a/4/Ik8J1fQYirf6wYRvRJ8Q/2020-03-20-novo-tracker-1.jpg',
            'https://1.bp.blogspot.com/-IsqNuk_7608/XozmvM64HxI/AAAAAAAAcMc/J3WFqNu6KgM-uTpVliQp8RBxL6pTicHrgCLcBGAsYHQ/s1600/Nova-Fiat-Strada-2021%2B%25282%2529.jpeg',
        'https://quatrorodas.abril.com.br/wp-content/uploads/2021/04/20210216_175315-e1620912560930.jpg?quality=70&strip=info',
    'https://1.bp.blogspot.com/-U5ro1ds6qcc/XSEG4IK2bmI/AAAAAAAAVio/yozhEhLS1MwAEAMYRbq2Vz192f9ABOdIQCLcBGAs/s1600/Prestige_09.jpg',
'https://1.bp.blogspot.com/-Vh0wh_5waos/X3YpA7RxdAI/AAAAAAAAjwc/fWgzV3K_nhgAbvNm7PBzPStDVn9ig3SFACLcBGAsYHQ/s2048/Hyundai%2BHB20%2B1.0%2BTGDI%2BDiamond%2BPlus_2.jpg',
'https://s3-sa-east-1.amazonaws.com/revista.mobiauto/ImagensSUVs/Jeep+Renegade/Jeep+Renegade+80+Anos/Jeep+Renegade+80+Anos+lateral.jpg']


puts "Creating fake cars"
puts "It takes some time. Calm down..."
count = 0
models.each do |element|
    car = Car.create!(model: element, year: rand(1990..2021), km: rand(50000..250000), location: locations.sample, daily_rate: rand(9..25), user_id: first_user.id )
    file = open(car_images[count])
    car.picture.attach(io: file, filename: 'some-image.jpg')
    count +=1
    puts "#{count} of #{models.count} done"
end


puts "Finished!"





