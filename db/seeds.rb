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
Visit.destroy_all
Folder.destroy_all
RentingFolder.destroy_all
Renting.destroy_all
Flow.destroy_all
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
thomas_first_flat = Flat.new(user: thomas, address: "5 rue de Buci, Paris 6e Arrondissement, Île-de-France, France", description: "Quartier central et animé, appartement spacieux avec de nombreux commerces à proximité.", category: "appartement", monthly_price: 1100, visible: true, rented: true, name: "Appartement central Paris 6", number_of_rooms: 2, number_of_bedrooms: 1, surface: 37, floor: 4, elevator: true, balcony: true, cellar: false, parking: true, heating_system: ["", "central", "gaz"], furnished: false)
attach_photo_flat("https://images.unsplash.com/photo-1550581190-9c1c48d21d6c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60", thomas_first_flat)
attach_photo_flat("https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60", thomas_first_flat)
attach_photo_flat("https://images.unsplash.com/flagged/photo-1573168710465-7f7da9a23a15?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60", thomas_first_flat)
thomas_first_flat.save!
thomas_second_flat = Flat.new(user: thomas, address: "30 rue Broca, Paris 5e Arrondissement, Île-de-France, France", description: "Superbe studio très bien aménagé dans un quartier animé de la Rive Gauche.", category: "appartement", monthly_price: 750, visible: true, rented: false, seloger: true, bienici: false, pap: true, leboncoin: true, name: "Studio meublé Paris 5", number_of_rooms: 1, number_of_bedrooms: 1, surface: 25, floor: 5, elevator: false, balcony: false, cellar: true, parking: false, heating_system: ["", "individuel", "électrique"], furnished: true)
attach_photo_flat("https://images.unsplash.com/photo-1505691938895-1758d7feb511?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80", thomas_second_flat)
attach_photo_flat("https://images.unsplash.com/photo-1451153378752-16ef2b36ad05?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", thomas_second_flat)
attach_photo_flat("https://images.unsplash.com/photo-1552454799-ca5cfdc612c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80", thomas_second_flat)
thomas_second_flat.save!
thomas_third_flat = Flat.new(user: thomas, address: "92 rue Sadi Carnot, Puteaux, Île de France", description: "Voisins très bruyants, mais superbe appartement avec vue Tour Eiffel dans la rue.", category: "appartement", monthly_price: 900, visible: true, rented: false, seloger: true, bienici: false, pap: true, leboncoin: true, name: "Puteaux appartement sympa", number_of_rooms: 1, number_of_bedrooms: 1, surface: 25, floor: 5, elevator: false, balcony: false, cellar: true, parking: false, heating_system: ["", "individuel", "électrique"], furnished: true)
attach_photo_flat("https://images.unsplash.com/photo-1505691938895-1758d7feb511?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80", thomas_third_flat)
attach_photo_flat("https://images.unsplash.com/photo-1451153378752-16ef2b36ad05?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", thomas_third_flat)
attach_photo_flat("https://images.unsplash.com/photo-1552454799-ca5cfdc612c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80", thomas_third_flat)
thomas_third_flat.save!
mao_first_flat = Flat.new(user: mao, address: "92 rue Sadi Carnot, Puteaux, Île de France", description: "Voisins très bruyants, mais superbe appartement avec vue Tour Eiffel dans la rue.", category: "appartement", monthly_price: 900, visible: true, rented: false, seloger: true, bienici: false, pap: true, leboncoin: true, name: "Puteaux appartement sympa", number_of_rooms: 1, number_of_bedrooms: 1, surface: 25, floor: 5, elevator: false, balcony: false, cellar: true, parking: false, heating_system: ["", "individuel", "électrique"], furnished: true)
attach_photo_flat("https://images.unsplash.com/photo-1505691938895-1758d7feb511?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80", mao_first_flat)
attach_photo_flat("https://images.unsplash.com/photo-1451153378752-16ef2b36ad05?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", mao_first_flat)
attach_photo_flat("https://images.unsplash.com/photo-1552454799-ca5cfdc612c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80", mao_first_flat)
mao_first_flat.save!
puts "#{Flat.count} flats created"

puts "Creating schedules"
first_schedule = Schedule.create!(start:Time.new(2020, 4, 20, 8, 30, 0),end:Time.new(2020, 4, 20, 9, 0, 0),flat: thomas_third_flat)
second_schedule = Schedule.create!(start:Time.new(2020, 4, 20, 9, 0, 0),end:Time.new(2020, 4, 20, 9, 30, 0),flat: thomas_third_flat)
third_schedule = Schedule.create!(start:Time.new(2020, 4, 21, 9, 30, 0),end:Time.new(2020, 4, 21, 10, 0, 0),flat: thomas_third_flat)
fourth_schedule = Schedule.create!(start:Time.new(2020, 4, 22, 9, 30, 0),end:Time.new(2020, 4, 22, 10, 0, 0),flat: thomas_third_flat)
fifth_schedule = Schedule.create!(start:Time.new(2020, 1, 22, 9, 30, 0),end:Time.new(2020, 1, 22, 10, 0, 0),flat: thomas_first_flat)
sixth_schedule = Schedule.create!(start:Time.new(2019, 1, 19, 9, 30, 0),end:Time.new(2019, 1, 19, 10, 00, 0),flat: thomas_first_flat)
sixth_schedule.created_at = "2019-01-18 15:07:07"
seventh_schedule = Schedule.create!(start:Time.new(2020, 4, 24, 9, 30, 0),end:Time.new(2020, 4, 24, 10, 00, 0),flat: thomas_third_flat)
puts "#{Schedule.count} created"

puts "Creating visits"

first_visit = Visit.create!(schedule: first_schedule, user: roxane, status: 'denied')
second_visit = Visit.create!(schedule: first_schedule, user: mao, status: 'accepted')
third_visit = Visit.create!(schedule: first_schedule, user: john, status: 'denied')
fourth_visit = Visit.create!(schedule: second_schedule, user: roxane)
fifth_visit = Visit.create!(schedule: second_schedule, user: mao)
sixth_visit = Visit.create!(schedule: second_schedule, user: john)
seventh_visit = Visit.create!(schedule: third_schedule, user: roxane)
height_visit = Visit.create!(schedule: third_schedule, user: mao)
nine_visit = Visit.create!(schedule: third_schedule, user: john)
ten_visit = Visit.create!(schedule: fourth_schedule, user: roxane)
eleven_visit = Visit.create!(schedule: fourth_schedule, user: mao)
twelve_visit = Visit.create!(schedule: fourth_schedule, user: john)
thirteen_visit = Visit.create!(schedule: fifth_schedule, user: roxane, status: 'accepted')
fourteen_visit = Visit.create!(schedule: sixth_schedule, user: mao, status: 'accepted')
fourteen_visit.created_at = "2019-01-20 15:07:07"
fifteen_visit = Visit.create!(schedule: seventh_schedule, user:thomas, status:'accepted')
puts "#{Visit.count} created"

puts "Creating renting_folders"
first_rentingfolder = RentingFolder.create!(visit: second_visit, status: 'accepted')
second_rentingfolder = RentingFolder.create!(visit: thirteen_visit, status: 'accepted')
third_rentingfolder = RentingFolder.create!(visit: fourteen_visit, status: 'accepted')
third_rentingfolder.created_at = "2019-01-21 15:07:07"
fourth_rentingfolder = RentingFolder.create!(visit: fifteen_visit, status: 'pending')
puts "#{RentingFolder.count} renting folders created"

puts "Creating folders"
roxane_folder = Folder.create!(user:roxane, renting_folder: second_rentingfolder)
mao_one_folder = Folder.create!(user:mao, renting_folder: third_rentingfolder)
john_folder = Folder.create!(user:john, renting_folder: first_rentingfolder)
mao_two_folder = Folder.create!(user:mao, renting_folder: first_rentingfolder)
thomas_fodler = Folder.create!(user: thomas, renting_folder: fourth_rentingfolder)
puts "#{Folder.count} folders created"

puts "Assign folders to renting_folders"
first_rentingfolder.folders = [john_folder, mao_two_folder]
second_rentingfolder.folders = [roxane_folder]
third_rentingfolder.folders = [mao_one_folder]
fourth_rentingfolder.folders = [thomas_fodler]
puts "This taks is done"

puts "Creating rentings"
roxane_thomas_renting = Renting.create!(flat: thomas_first_flat, renting_folder: second_rentingfolder, created_at: 'Fri, 28 Dec 2019 14:27:32 UTC +00:00', start_date: 'Fri, 12 Mar 2012 14:27:32 UTC +00:00', status: 'current')
mao_thomas_renting = Renting.create!(flat: thomas_first_flat, renting_folder: third_rentingfolder, created_at: 'Fri, 28 Jan 2019 14:27:32 UTC +00:00', start_date: 'Fri, 23 Mar 2019 14:27:32 UTC +00:00', end_date: 'Fri, 23 Dec 2019 14:27:32 UTC +00:00', status: 'past')
john_thomas_renting = Renting.create!(flat: thomas_second_flat, renting_folder: first_rentingfolder, created_at: 'Fri, 28 Jan 2020 14:27:32 UTC +00:00', status: 'ongoing')
puts "#{Renting.count} renting created"

puts "Creating flows"
Flow.create!(title: "Loyer", renting: roxane_thomas_renting, payment_date: Time.new(2020, 3, 9, 8, 30, 0), month_rent: Date.new(2020,4,3).mon, amount: 1100, category: "income")
Flow.create!(title: "Réparations", renting: mao_thomas_renting, payment_date: Time.new(2020, 3, 9, 8, 30, 0), month_rent: Date.new(2001,2,3).mon, amount: 800, category: "spending")
Flow.create!(title: "Loyer", renting: john_thomas_renting, payment_date: Time.new(2020, 3, 9, 8, 30, 0), month_rent: Date.new(2001,2,3).mon, amount: 800, category: "income")
Flow.create!(title: "Loyer", renting: roxane_thomas_renting, payment_date: Time.new(2020, 3, 9, 8, 30, 0), month_rent: Date.new(2001,2,3).mon, amount: 900, category: "income")
Flow.create!(title: "Loyer", renting: roxane_thomas_renting, payment_date: Time.new(2020, 3, 9, 8, 30, 0), month_rent: Date.new(2001,2,3).mon, amount: 700, category: "income")
Flow.create!(title: "Loyer", renting: roxane_thomas_renting, payment_date: Time.new(2020, 3, 9, 8, 30, 0), month_rent: Date.new(2001,2,3).mon, amount: 700, category: "income")
Flow.create!(title: "Réparations", renting: roxane_thomas_renting, payment_date: Time.new(2020, 3, 9, 8, 30, 0), month_rent: Date.new(2001,2,3).mon, amount: 66.50, category: "spending")
puts puts "#{Flow.count} flows created"

puts "G O O D     L U C K      G U Y S"

