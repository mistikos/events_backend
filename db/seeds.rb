# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10.times do
  Category.create(name: Faker::Lorem.word)
end


20.times do
  Company.create(name: Faker::Company.name, category_id: Category.pluck(:id).sample, email: Faker::Internet.email, address: Faker::Address.street_address, phone: Faker::PhoneNumber.phone_number, logo: "http://pigment.github.io/fake-logos/logos/small/color/#{rand(1...13)}.png")
end

Admin.create email: 'videmor@gmail.com', fullname: 'angel rojitas', company_id: Company.pluck(:id).sample, password: 'please', dni: rand.to_s[2..9]
Admin.create email: 'angelsystem@gmail.com', fullname: 'angel rojitas', company_id: Company.pluck(:id).sample, password: 'please', dni: rand.to_s[2..9]
Admin.create email: 'gramirez@gmail.com', fullname: 'chalo gonzale', company_id: Company.pluck(:id).sample, password: 'please', dni: rand.to_s[2..9]

20.times do
  admin = Admin.all.sample
  client = Client.create(fullname: Faker::Name.name, dni: Faker::Address.building_number, email: Faker::Internet.email, creator_id: admin.id, gender: ['f', 'm'].sample)
  client.company_ids = admin.id
end


9.times do
  EventType.create(name: Faker::Lorem.word)
end
EventType.create(name: 'Otros')

20.times do
  latitude = rand(-90.000000000...90.000000000)
  longitude = rand(-180.000000000...180.000000000)
  Event.create(name: Faker::Lorem.word, event_type_id: EventType.pluck(:id).sample, start_at: Time.now + rand((1..30)).days, duration: rand(1..10), place: Faker::Company.name, location: Faker::Address.street_address, latitude: latitude, longitude: longitude,  address: Faker::Address.city, company_id: Company.pluck(:id).sample, creator_id: Admin.pluck(:id).sample, description: Faker::Lorem.sentence(3))
end

user = User.create email: 'naruto@gmail.com', fullname: 'izumaky naruto', password: 'please', dni: rand.to_s[2..9]
user.company_ids = Company.pluck(:id).sample(2)
user1 = User.create email: 'sasuke@gmail.com', fullname: 'sasuke uchiha', password: 'please', dni: rand.to_s[2..9]
user1.company_ids = Company.pluck(:id).sample(2)