# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 20.times do
#   Company.create(name: Faker::Company.name, email: Faker::Internet.email, address: Faker::Address.street_address, phone: Faker::PhoneNumber.phone_number, logo: "http://pigment.github.io/fake-logos/logos/small/color/#{rand(1...13)}.png")
# end

# 20.times do
#   Client.create(fullname: Faker::Name.name, dni: Faker::Address.building_number, email: Faker::Internet.email, company_id: Company.pluck(:id).sample, gender: ['f', 'm'].sample, creator_id: Admin.pluck(:id).sample)
# end

# 20.times do
#   latitude = rand(-90.000000000...90.000000000)
#   longitude = rand(-180.000000000...180.000000000)
#   Event.create(name: Faker::Lorem.word, start_at: Time.now + rand((1..30)).days, duration: rand(1..10), place: Faker::Company.name, address: Faker::Address.street_address, latitude: latitude, longitude: longitude, country: Faker::Address.country, locality: Faker::Address.city, state: Faker::Address.city_prefix, company_id: Company.pluck(:id).sample, creator_id: Admin.pluck(:id).sample, description: Faker::Lorem.sentence(3))
# end