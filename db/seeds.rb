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

puts "Cleaning DB"
User.destroy_all
Flat.destroy_all
Schedule.destroy_all
Renting.destroy_all
puts "All clean"

def attach_photo_user(string, user)
  file = URI.open(string)
  user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
end
def attach_photo_flat(string, flat)
  file = URI.open(string)
  flat.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
end

puts "Creating users"
roxane = User.new(first_name: "Roxane", last_name: "Haddad", phone_number: "0664784489", email: "roxane.haddad@gmail.com", password: "roxane.haddad@gmail.com", description: "26 ans, en CDI confirmé depuis 3 ans, célibataire, sans animaux.")
attach_photo_user("https://avatars0.githubusercontent.com/u/54777799?v=4", roxane)
roxane.save
john = User.new(first_name: "Jonathan", last_name: "Courdavault", phone_number: "0778381974", email: "jo.courdavault@gmail.com", password: "jo.courdavault@gmail.com")
attach_photo_user("https://avatars2.githubusercontent.com/u/58211236?v=4", john)
john.save
thomas = User.new(first_name: "Thomas", last_name: "Rodier", phone_number: "0668489169", email: "rodiert17@gmail.com", password: "rodiert17@gmail.com")
attach_photo_user("https://avatars1.githubusercontent.com/u/57214511?v=4", thomas)
thomas.save
mao = User.new(first_name: "Maodo", last_name: "Diop", phone_number: "0663906049", email: "maodod1@gmail.com", password: "maodod1@gmail.com")
attach_photo_user("https://avatars1.githubusercontent.com/u/56120487?v=4", mao)
mao.save
puts "#{User.count} users created"

puts "Creating flats"

thomas_first_flat = Flat.new(user: thomas, address: "5 rue de Buci, 75006, Paris", description: "Quartier central et animé, appartement spacieux avec de nombreux commerces à proximité.", monthly_price: 1100, visible: true, rented: true, name: "Appartement central Paris 6", number_of_rooms: 2, number_of_bedrooms: 1, surface: 37, floor: 4, elevator: true, balcony: true, cellar: false, parking: true, heating_system: ["", "central", "gaz"], furnished: false)
attach_photo_flat("https://images.unsplash.com/photo-1550581190-9c1c48d21d6c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60", thomas_first_flat)
attach_photo_flat("https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60", thomas_first_flat)
attach_photo_flat("https://images.unsplash.com/flagged/photo-1573168710465-7f7da9a23a15?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60", thomas_first_flat)
thomas_first_flat.save
thomas_second_flat = Flat.new(user: thomas, address: "30 rue Broca, 75005, Paris", description: "Superbe studio très bien aménagé dans un quartier animé de la Rive Gauche.", monthly_price: 750, visible: true, rented: false, seloger: true, bienici: false, pap: true, leboncoin: true, name: "Studio meublé Paris 13", number_of_rooms: 1, number_of_bedrooms: 1, surface: 25, floor: 5, elevator: false, balcony: false, cellar: true, parking: false, heating_system: ["", "individuel", "électrique"], furnished: true)
attach_photo_flat("https://images.unsplash.com/photo-1505691938895-1758d7feb511?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80", thomas_second_flat)
attach_photo_flat("https://images.unsplash.com/photo-1451153378752-16ef2b36ad05?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", thomas_second_flat)
attach_photo_flat("https://images.unsplash.com/photo-1552454799-ca5cfdc612c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80", thomas_second_flat)
thomas_second_flat.save
puts "#{Flat.count} flats created"

puts "Creating schedules"
first_schedule = Schedule.create!(start:Time.new(2020, 3, 3, 8, 30, 0),end:Time.new(2020, 3, 3, 9, 0, 0),flat: thomas_second_flat)
second_schedule = Schedule.create!(start:Time.new(2020, 3, 3, 9, 0, 0),end:Time.new(2020, 3, 3, 9, 30, 0),flat: thomas_second_flat)
third_schedule = Schedule.create!(start:Time.new(2020, 3, 4, 9, 30, 0),end:Time.new(2020, 3, 4, 10, 0, 0),flat: thomas_second_flat)
puts "#{Schedule.count} created"

puts "Creating renting"
roxane_thomas_renting = Renting.create!(flat: thomas_first_flat, user: roxane, created_at: 'Fri, 28 Dec 2019 14:27:32 UTC +00:00')
puts "#{Renting.count} renting created"

puts "G O O D     L U C K      G U Y S"

