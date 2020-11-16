# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# http://ruby-doc.org/stdlib-2.0.0/libdoc/open-uri/rdoc/OpenURI.html
require 'open-uri'
require 'json'

serialized_addresses = open('https://raw.githubusercontent.com/EthanRBrown/rrad/master/addresses-us-100.json').read
addresses = JSON.parse(serialized_addresses)
addresses = addresses['addresses']

# {"address1"=>"6007 Applegate Lane",
#  "address2"=>"",
#  "city"=>"Louisville",
#  "state"=>"KY",
#  "postalCode"=>"40219",
#  "coordinates"=>{"lat"=>38.1343013, "lng"=>-85.6498512}}

flat_names = ['Beautiful loft with a view', 'Cosy flat in the center', 'Shithole', 'Pedros Bumsbude']
price_per_night = (10..100).to_a.sample
number_of_guests = (1..5).to_a.sample
number_of_nights = (1..14).to_a.sample

Flat.destroy_all
Client.destroy_all
# Booking.destroy_all

puts 'Seeding flats'
flat_names.each do |flat_name|
  address = addresses.sample
  p address
  flat = Flat.new(
    name: flat_name,
    description: Faker::Quotes::Shakespeare.as_you_like_it_quote,
    address: "#{address['address1']}, #{address['city']}, #{address['postalCode']}",
    price_per_night: price_per_night,
    number_of_guests: number_of_guests
  )
  flat.save
end

names = %w[Tom Pedro Rosi]

puts 'Seeding client'
names.each do |name|
  address = addresses.sample
  client = Client.new(
    name: name,
    address: "#{address['address1']}, #{address['city']}, #{address['postalCode']}"
  )
  client.save
end

puts 'Seeding bookings'
10.times do
  client = Client.all.sample
  flat = Flat.all.sample
  nights = number_of_nights

  booking = Booking.new(
    nights: nights,
    total_price: nights * flat.price_per_night
  )

  booking.client = client
  booking.flat = flat
  booking.save
end

p Flat.count
p Client.count
p Booking.count
