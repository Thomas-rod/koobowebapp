# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'
require 'faker'

  # url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
  # ingredients_serialized = open(url).read
  # ingredients = JSON.parse(ingredients_serialized)
puts "cleaning user, Flats, shedules"
User.destroy_all
Flat.destroy_all
Schedule.destroy_all
puts "table flats shedules user have been deleted"

def attach_photo_user(string, user)
  file = URI.open(string)
  user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
end
def attach_photo_flat(string, flat)
  file = URI.open(string)
  flat.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
end

puts "creating User"

roxane = User.new(first_name: "Roxane", last_name: "Haddad", phone_number: "0664784489", email: "roxane.haddad@gmail.com", password: "123412")
attach_photo_user("https://avatars0.githubusercontent.com/u/54777799?v=4", roxane)
roxane.save
john = User.new(first_name: "Jonathan", last_name: "Courdavault", phone_number: "0778381974", email: "jo.courdavault@gmail.com", password: "567856")
attach_photo_user("https://avatars2.githubusercontent.com/u/58211236?v=4", john)
john.save
thomas = User.new(first_name: "Thomas", last_name: "Rodier", phone_number: "0668489169", email: "rodiert17@gmail.com", password: "432143")
attach_photo_user("https://avatars1.githubusercontent.com/u/57214511?v=4", thomas)
thomas.save
mao = User.new(first_name: "Maodo", last_name: "Diop", phone_number: "0663906049", email: "maodod1@gmail.com", password: "876587")
attach_photo_user("https://avatars1.githubusercontent.com/u/56120487?v=4", mao)
mao.save
puts "#{User.count} users have beeen created"

# puts "Flats seeding..."
# num = roxane.id - 1
# 4.times do
#   num += 1
#   address = Faker::Address.full_address
#   description = Faker::Lorem.sentence(word_count: 25)
#   monthly_price = Faker::Number.within(range: 500..1500)
#   Flat.create!(address: address, description: description, monthly_price: monthly_price.to_i, user_id: num)
# end

roxane_flat = Flat.new(user_id: roxane.id, address: "4 rue des Prêtres Saint-Séverin, 75005, Paris", description: "Quartier central et animé, appartement cosy avec magnifique vue.", monthly_price: 783, visible: true, rented: false, name: "Haddad House", number_of_rooms: 2, number_of_bedrooms: 1, surface: 23, floor: 5, elevator: true, balcony: false, cellar: false, parking: false, heating_system: ["individuel", "électrique"], furnished: false)
attach_photo_flat("https://images.unsplash.com/photo-1471623320832-752e8bbf8413?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", roxane_flat)
attach_photo_flat("https://images.unsplash.com/photo-1529408632839-a54952c491e5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", roxane_flat)
roxane_flat.save
mao_flat = Flat.new(user_id: roxane.id, address: "12 rue Madeleine Laffitte, 93100, Montreuil", description: "Superbe pavillon, parfait pour une famille aimant cuisiner.", monthly_price: 2200, visible: true, rented: false, name: "Diop House", number_of_rooms: 7, number_of_bedrooms: 5, surface: 80, floor: 3, elevator: false, balcony: true, cellar: true, parking: true, heating_system: ["collectif", "gaz"], furnished: false)
attach_photo_flat("https://images.unsplash.com/photo-1464890100898-a385f744067f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", mao_flat)
attach_photo_flat("https://images.unsplash.com/photo-1451153378752-16ef2b36ad05?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", mao_flat)
mao_flat.save

renting_mao_roxane = Renting.create!(flat: roxane_flat, user: mao)

puts "#{roxane.flats.count} flats have been created"
puts "Now we creating 4 Shedules by flats"
puts "........."

  Schedule.create!(start:Time.new(2020, 3, 2, 8, 0, 0),end:Time.new(2020, 3, 2, 8, 30, 0),flat_id:roxane.flats.first.id)
  Schedule.create!(start:Time.new(2020, 3, 2, 8, 30, 0),end:Time.new(2020, 3, 2, 9, 0, 0),flat_id:roxane.flats.first.id)
  Schedule.create!(start:Time.new(2020, 3, 3, 9, 0, 0),end:Time.new(2020, 3, 3, 9, 30, 0),flat_id:roxane.flats.first.id)
  Schedule.create!(start:Time.new(2020, 3, 4, 9, 30, 0),end:Time.new(2020, 3, 4, 10, 0, 0),flat_id:roxane.flats.first.id)


  Schedule.create!(start:Time.new(2020, 3, 2, 13, 0, 0),end:Time.new(2020, 3, 2, 13, 30, 0),flat_id:roxane.flats.last.id)
  Schedule.create!(start:Time.new(2020, 3, 2, 13, 30, 0),end:Time.new(2020, 3, 2, 14, 0, 0),flat_id:roxane.flats.last.id)
  Schedule.create!(start:Time.new(2020, 3, 2, 14, 0, 0),end:Time.new(2020, 3, 2, 14, 30, 0),flat_id:roxane.flats.last.id)
  Schedule.create!(start:Time.new(2020, 3, 2, 14, 30, 0),end:Time.new(2020, 3, 2, 15, 0, 0),flat_id:roxane.flats.last.id)

 thomas.flats.each do |flat|
  Schedule.create!(start:Time.new(2020, 3, 2, 7, 0, 0),end:Time.new(2020, 3, 2, 7, 30, 0),flat_id:flat.id)
  Schedule.create!(start:Time.new(2020, 3, 2, 8, 30, 0),end:Time.new(2020, 3, 2, 9, 0, 0),flat_id:flat.id)
  Schedule.create!(start:Time.new(2020, 3, 2, 9, 0, 0),end:Time.new(2020, 3, 2, 9, 30, 0),flat_id:flat.id)
  Schedule.create!(start:Time.new(2020, 3, 2, 9, 30, 0),end:Time.new(2020, 3, 2, 10, 0, 0),flat_id:flat.id)
end
 mao.flats.each do |flat|
  Schedule.create!(start:Time.new(2020, 3, 2, 17, 0, 0),end:Time.new(2020, 3, 2, 17, 30, 0),flat_id:flat.id)
  Schedule.create!(start:Time.new(2020, 3, 2, 17, 30, 0),end:Time.new(2020, 3, 2, 18, 0, 0),flat_id:flat.id)
  Schedule.create!(start:Time.new(2020, 3, 2, 18, 0, 0),end:Time.new(2020, 3, 2, 18, 30, 0),flat_id:flat.id)
  Schedule.create!(start:Time.new(2020, 3, 2, 18, 30, 0),end:Time.new(2020, 3, 2, 19, 0, 0),flat_id:flat.id)
end

puts "you have now 4 schedules by flats "
puts "total schedules = #{Schedule.count}"
puts "G O O D     L U C K      G U Y S"


