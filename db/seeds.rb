# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Accomodation.destroy_all
City.destroy_all
Reservation.destroy_all
User.destroy_all

cities = Array.new
users = Array.new
accomodations = Array.new


Faker::Config.locale = 'fr'


20.times do 
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.cell_phone,
    description: Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 10),
  )
  users << user
end


  10.times do 
    city = City.create(
      name: Faker::Address.city,
      zip_code: Faker::Address.zip_code,
    )
    cities << city
  end 

  50.times do 
    accomodation = Accomodation.create(
      available_beds: rand(1..15),
      price: rand(1..200),
      description: Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 10),
      has_wifi: [true, false].sample,
      welcome_message: Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 10),
      city_id: cities[rand(0..9)].id,
      user_id: users[rand(0..19)].id,
    )
    accomodations << accomodation
  end 


  5.times do
    reservation = Reservation.create(
      start_date: Faker::Date.between(from: '2020-05-01', to: '2020-08-01'),
      end_date: Faker::Date.between(from: '2020-05-02', to: '2020-08-02'),
      accomodation_id: accomodations[rand(0..49)].id,
      manager_id: users[rand(0..19)].id,
      guest_id: users[rand(0..19)].id,
    )
  end 

  
  5.times do
    reservation = Reservation.create(
      start_date: Faker::Date.between(from: '2020-09-01', to: '2020-11-30'),
      end_date: Faker::Date.between(from: '2020-09-02', to: '2020-11-30'),
      accomodation_id: accomodations[rand(0..49)].id,
      manager_id: users[rand(0..19)].id,
      guest_id: users[rand(0..19)].id,
    )
  end 
