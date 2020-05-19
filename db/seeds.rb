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




#--------------------------------------------------------------------------------------------------------#
#-------------------------------------------USERS--------------------------------------------------------#
#--------------------------------------------------------------------------------------------------------#
puts "Creating users"
joker = User.new(first_name: "joker", last_name: "Jok'air", phone_number: "0664784489", email: "joker@gmail.com", password: "joker@gmail.com", description: "26 ans, en CDI confirmé depuis 3 ans, célibataire, sans animaux.")
joker.save!
john = User.new(first_name: "Jonathan", last_name: "Courdavault", phone_number: "0778381974", email: "jo@gmail.com", password: "jo@gmail.com")
attach_photo_user("https://avatars2.githubusercontent.com/u/58211236?v=4", john)
john.save!
thomas = User.new(first_name: "Thomas", last_name: "Rodier", phone_number: "0668489169", email: "thomas@koobo.co", password: "thomas@koobo.co")
attach_photo_user("https://avatars1.githubusercontent.com/u/57214511?v=4", thomas)
thomas.save!
stefan = User.new(first_name: "Stefan", last_name: "Diop", phone_number: "0663906049", email: "stefan@gmail.com", password: "stefan@gmail.com")
stefan.save!
puts "#{User.count} users created"





#--------------------------------------------------------------------------------------------------------#
#-------------------------------------------FLATS--------------------------------------------------------#
#--------------------------------------------------------------------------------------------------------#
puts "Creating flats"
#*------------------------------------*#
  # THIS FLAT IS RENTED AND HAD A PREVIOUS RENTING
#*------------------------------------*#
thomas_first_flat = Flat.new(user: thomas, address: "5 rue de Buci, Paris 6e Arrondissement, Île-de-France, France", description: "Quartier central et animé, appartement spacieux avec de nombreux commerces à proximité.", category: "appartement", monthly_price: 1100, visible: true, rented: true, name: "Appartement central Paris 6", number_of_rooms: 2, number_of_bedrooms: 1, surface: 37, floor: 4, elevator: true, balcony: true, cellar: false, parking: true, heating_system: ["", "central", "gaz"] ,furnished: false)
attach_photo_flat("https://images.unsplash.com/photo-1550581190-9c1c48d21d6c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60", thomas_first_flat)
attach_photo_flat("https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60", thomas_first_flat)
attach_photo_flat("https://images.unsplash.com/flagged/photo-1573168710465-7f7da9a23a15?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60", thomas_first_flat)
thomas_first_flat.save!

#*------------------------------------*#
  # THIS FLAT IS ONGOING TO BE RENTED
#*------------------------------------*#
thomas_second_flat = Flat.new(user: thomas, address: "30 rue Broca, Paris 5e Arrondissement, Île-de-France, France", description: "Superbe studio très bien aménagé dans un quartier animé de la Rive Gauche.", category: "appartement", monthly_price: 750, visible: true, rented: false, seloger: true, bienici: false, pap: true, leboncoin: true, name: "Studio meublé Paris 5", number_of_rooms: 1, number_of_bedrooms: 1, surface: 25, floor: 5, elevator: false, balcony: false, cellar: true, parking: false, heating_system: ["", "individuel", "électrique"] ,furnished: true)
attach_photo_flat("https://images.unsplash.com/photo-1505691938895-1758d7feb511?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80", thomas_second_flat)
attach_photo_flat("https://images.unsplash.com/photo-1451153378752-16ef2b36ad05?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", thomas_second_flat)
attach_photo_flat("https://images.unsplash.com/photo-1552454799-ca5cfdc612c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80", thomas_second_flat)
thomas_second_flat.save!

#*------------------------------------*#
  # THIS FLAT NOT RENTED AND A LOT OF VISITS / RENTING_FOLDER
#*------------------------------------*#
thomas_third_flat = Flat.new(user: thomas, address: "92 rue Sadi Carnot, Puteaux, Île de France", description: "Voisins très bruyants, mais superbe appartement avec vue Tour Eiffel dans la rue.", category: "appartement", monthly_price: 900, visible: true, rented: false, seloger: true, bienici: false, pap: true, leboncoin: true, name: "Puteaux appartement sympa", number_of_rooms: 1, number_of_bedrooms: 1, surface: 25, floor: 5, elevator: false, balcony: false, cellar: true, parking: false, heating_system: ["", "individuel", "électrique"] ,furnished: true)
attach_photo_flat("https://images.unsplash.com/photo-1505691938895-1758d7feb511?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80", thomas_third_flat)
attach_photo_flat("https://images.unsplash.com/photo-1451153378752-16ef2b36ad05?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", thomas_third_flat)
attach_photo_flat("https://images.unsplash.com/photo-1552454799-ca5cfdc612c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80", thomas_third_flat)
thomas_third_flat.save!

#*------------------------------------*#
  # THIS FLAT IS TEST TO KNOW IF I CAN HAVE ACCESS TO AN OTHER FLAT (PUNDIT)
#*------------------------------------*#
stefan_first_flat = Flat.new(user: stefan, address: "92 rue Sadi Carnot, Puteaux, Île de France", description: "Voisins très bruyants, mais superbe appartement avec vue Tour Eiffel dans la rue.", category: "appartement", monthly_price: 900, visible: true, rented: false, seloger: true, bienici: false, pap: true, leboncoin: true, name: "Puteaux appartement sympa", number_of_rooms: 1, number_of_bedrooms: 1, surface: 25, floor: 5, elevator: false, balcony: false, cellar: true, parking: false, heating_system: ["", "individuel", "électrique"] ,furnished: true)
attach_photo_flat("https://images.unsplash.com/photo-1505691938895-1758d7feb511?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80", stefan_first_flat)
attach_photo_flat("https://images.unsplash.com/photo-1451153378752-16ef2b36ad05?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", stefan_first_flat)
attach_photo_flat("https://images.unsplash.com/photo-1552454799-ca5cfdc612c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80", stefan_first_flat)
stefan_first_flat.save!
puts "#{Flat.count} flats created"




#--------------------------------------------------------------------------------------------------------#
#-------------------------------------------SCHEDULES----------------------------------------------------#
#--------------------------------------------------------------------------------------------------------#
puts "Creating schedules"
#*------------------------------------*#
  # FIRST FLAT SCHEDULES
#*------------------------------------*#
first_schedule_first_flat = Schedule.create!(start:Time.new(2019, 12, 27, 8, 30, 0),end:Time.new(2019, 12, 27, 9, 0, 0),flat: thomas_first_flat, booked: true)
second_schedule_first_flat = Schedule.create!(start:Time.new(2019, 12, 27, 9, 00, 0),end:Time.new(2019, 12, 27, 9, 30, 0),flat: thomas_first_flat, booked: true)
third_schedule_first_flat = Schedule.create!(start:Time.new(2020, 4, 24, 9, 00, 0),end:Time.new(2020, 4, 24, 9, 30, 0),flat: thomas_first_flat, booked: true)
fourth_schedule_first_flat = Schedule.create!(start:Time.new(2020, 4, 24, 9, 30, 0),end:Time.new(2020, 4, 24, 10, 0, 0),flat: thomas_first_flat, booked: true)
fifth_schedule_first_flat = Schedule.create!(start:Time.new(2020, 5, 24, 9, 30, 0),end:Time.new(2020, 5, 24, 10, 0, 0),flat: thomas_first_flat)

#*------------------------------------*#
  # SECOND FLAT SCHEDULES
#*------------------------------------*#
first_schedule_second_flat = Schedule.create!(start:Time.new(2020, 5, 2, 9, 00, 0),end:Time.new(2020, 5, 2, 9, 30, 0),flat: thomas_second_flat, booked: true)

#*------------------------------------*#
  # THIRD FLAT SCHEDULES
#*------------------------------------*#
second_schedule = Schedule.create!(start:Time.new(2020, 5, 20, 9, 0, 0),end:Time.new(2020, 5, 20, 9, 30, 0),flat: thomas_third_flat)
third_schedule = Schedule.create!(start:Time.new(2020, 5, 21, 9, 30, 0),end:Time.new(2020, 5, 21, 10, 0, 0),flat: thomas_third_flat)
fourth_schedule = Schedule.create!(start:Time.new(2020, 5, 22, 9, 30, 0),end:Time.new(2020, 5, 22, 10, 0, 0),flat: thomas_third_flat)
seventh_schedule = Schedule.create!(start:Time.new(2020, 5, 24, 9, 30, 0),end:Time.new(2020, 5, 24, 10, 00, 0),flat: thomas_third_flat, booked: true)

#*------------------------------------*#
  # FOURTH FLAT SCHEDULES
#*------------------------------------*#
first_schedule_fourth_flat = Schedule.create!(start:Time.new(2020, 5, 20, 9, 0, 0),end:Time.new(2020, 5, 20, 9, 30, 0),flat: stefan_first_flat)
second_schedule_fourth_flat = Schedule.create!(start:Time.new(2020, 5, 20, 9, 30, 0),end:Time.new(2020, 5, 20, 10, 0, 0),flat: stefan_first_flat)
third_schedule_fourth_flat = Schedule.create!(start:Time.new(2020, 5, 20, 10, 0, 0),end:Time.new(2020, 5, 20, 10, 30, 0),flat: stefan_first_flat)
fourth_schedule_fourth_flat = Schedule.create!(start:Time.new(2020, 5, 20, 10, 30, 0),end:Time.new(2020, 5, 20, 11, 0, 0),flat: stefan_first_flat)
fifth_schedule_fourth_flat = Schedule.create!(start:Time.new(2020, 5, 20, 11, 0, 0),end:Time.new(2020, 5, 20, 11, 30, 0),flat: stefan_first_flat)
sixth_schedule_fourth_flat = Schedule.create!(start:Time.new(2020, 5, 20, 11, 30, 0),end:Time.new(2020, 5, 20, 12, 0, 0),flat: stefan_first_flat)
seventh_schedule_fourth_flat = Schedule.create!(start:Time.new(2020, 5, 20, 12, 0, 0),end:Time.new(2020, 5, 20, 12, 30, 0),flat: stefan_first_flat)
puts "#{Schedule.count} schedules created"



#--------------------------------------------------------------------------------------------------------#
#-------------------------------------------VISITS-------------------------------------------------------#
#--------------------------------------------------------------------------------------------------------#
puts "Creating visits"
#*------------------------------------*#
  #VISITS FOR FIRST FLAT FIRST RENTING
#*------------------------------------*#
first_visit_first_schedule_first_flat = Visit.create!(schedule: first_schedule_first_flat, user: joker, status: 'denied', contract: 'CDI', income: 2230, people: 1, phone: Faker::PhoneNumber.phone_number)
second_visit_first_schedule_first_flat = Visit.create!(schedule: first_schedule_first_flat, user: stefan, status: 'accepted', contract: 'CDI', income: 5030, people: 1, phone: Faker::PhoneNumber.phone_number)
first_visit_second_schedule_first_flat = Visit.create!(schedule: second_schedule_first_flat, user: john, status: 'accepted', contract: 'CDI', income: 3030, people: 1, phone: Faker::PhoneNumber.phone_number)
#*------------------------------------*#
  # VISITS FOR FIRST FLAT SECOND RENTINGS
#*------------------------------------*#
first_visit_third_schedule_first_flat = Visit.create!(schedule: third_schedule_first_flat, user: john, status: 'denied', contract: 'CDI', income: 2230, people: 1, phone: Faker::PhoneNumber.phone_number)
second_visit_third_schedule_first_flat = Visit.create!(schedule: fourth_schedule_first_flat, user: joker, status: 'accepted', contract: 'CDI', income: 2230, people: 1, phone: Faker::PhoneNumber.phone_number)

#*------------------------------------*#
  #VISITS FOR SECOND FLAT
#*------------------------------------*#
first_visit_first_schedule_second_flat = Visit.create!(schedule: first_schedule_second_flat, user: john, status: 'accepted', contract: 'CDI', income: 4000, people: 2, phone: Faker::PhoneNumber.phone_number)
second_visit_first_schedule_second_flat = Visit.create!(schedule: first_schedule_second_flat, user: stefan, status: 'denied', contract: 'CDI', income: 1800, people: 1, phone: Faker::PhoneNumber.phone_number)

#*------------------------------------*#
  #VISITS FOR THIRD FLAT
#*------------------------------------*#
fourth_visit = Visit.create!(schedule: second_schedule, user: joker, contract: 'Intermittent', income: 2230, people: 1, phone: Faker::PhoneNumber.phone_number)
fifth_visit = Visit.create!(schedule: second_schedule, user: stefan, contract: 'CDI', income: 2000, people: 1, phone: Faker::PhoneNumber.phone_number)
sixth_visit = Visit.create!(schedule: second_schedule, user: john, contract: 'CDI', income: 1920, people: 1, phone: Faker::PhoneNumber.phone_number)
seventh_visit = Visit.create!(schedule: third_schedule, user: joker, contract: 'Interime', income: 1230, people: 1, phone: Faker::PhoneNumber.phone_number)
height_visit = Visit.create!(schedule: third_schedule, user: stefan, contract: "Chef d'entreprise", income: 2230, people: 1, phone: Faker::PhoneNumber.phone_number)
nine_visit = Visit.create!(schedule: third_schedule, user: john, contract: 'CDI', income: 2230, people: 1, phone: Faker::PhoneNumber.phone_number)
ten_visit = Visit.create!(schedule: fourth_schedule, user: joker, contract: 'CDI', income: 2230, people: 1, phone: Faker::PhoneNumber.phone_number)
eleven_visit = Visit.create!(schedule: fourth_schedule, user: stefan, contract: 'CDI', income: 2230, people: 1, phone: Faker::PhoneNumber.phone_number)
twelve_visit = Visit.create!(schedule: fourth_schedule, user: john, contract: 'CDD', income: 2230, people: 1, phone: Faker::PhoneNumber.phone_number)
puts "#{Visit.count} visits created"


#--------------------------------------------------------------------------------------------------------#
#-------------------------------------------RENTING_FOLDERS----------------------------------------------#
#--------------------------------------------------------------------------------------------------------#
puts "Creating renting_folders"
#*------------------------------------*#
  # THIS RENTING FOLDER FIRST FLAT FIRST RENTING
#*------------------------------------*#
first_renting_folder_first_flat = RentingFolder.new(visit: second_visit_first_schedule_first_flat, status: 'accepted')
#*------------------------------------*#
  # THIS RENTING FOLDER FIRST FLAT SECOND RENTING
#*------------------------------------*#
second_renting_folder_first_flat = RentingFolder.new(visit: second_visit_third_schedule_first_flat, status: 'accepted')
#*------------------------------------*#
  # THIS RENTING FOLDER SECOND FLAT FIRST RENTING
#*------------------------------------*#
first_renting_folder_second_flat = RentingFolder.new(visit: first_visit_first_schedule_second_flat, status: 'accepted')

puts "#{RentingFolder.count} renting folders created"

#--------------------------------------------------------------------------------------------------------#
#-------------------------------------------RENTINGS-----------------------------------------------------#
#--------------------------------------------------------------------------------------------------------#
puts "Creating rentings"
#*------------------------------------*#
  # FIRST RENTING FIRST FLAT
#*------------------------------------*#
stefan_renting_first_flat = Renting.create!(flat: thomas_first_flat, renting_folder: first_renting_folder_first_flat, created_at: 'Fri, 28 Dec 2019 14:27:32 UTC +00:00', start_date: 'Sat, 29 Dec 2019 14:27:32 UTC +00:00', end_date: 'Sat, 23 Apr 2020 14:27:32 UTC +00:00', status: 'past')

#*------------------------------------*#
  # SECOND RENTING FIRST FLAT
#*------------------------------------*#
joker_renting_first_flat = Renting.create!(flat: thomas_first_flat, renting_folder: second_renting_folder_first_flat, created_at: 'Fri, 28 Dec 2019 14:27:32 UTC +00:00', start_date: 'Sat, 26 Apr 2020 14:27:32 UTC +00:00', status: 'current')
#*------------------------------------*#
  # THIS RENTING SECOND FLAT FIRST RENTING
#*------------------------------------*#
john_thomas_renting = Renting.create!(flat: thomas_second_flat, renting_folder: first_renting_folder_second_flat, created_at: 'Fri, 8 Mar 2020 14:27:32 UTC +00:00', status: 'ongoing')
puts "#{Renting.count} renting created"



#--------------------------------------------------------------------------------------------------------#
#----------------------------------------FLOWS-----------------------------------------------------------#
#--------------------------------------------------------------------------------------------------------#
puts "Creating flows"
Flow.create!(title: "Réparations eau", renting: joker_renting_first_flat, payment_date: Time.new(2020, 3, 9, 8, 30, 0), month_rent: Date.new(2020,4,1).mon, year_rent: Date.new(2020,4,1).year, amount: 400, category: "dépense")
Flow.create!(title: "Réparations", renting: joker_renting_first_flat, payment_date: Time.new(2020, 3, 9, 8, 30, 0), month_rent: Date.new(2020,4,3).mon, year_rent: Date.new(2020,4,3).year, amount: 1100, category: "dépense")
Flow.create!(title: "Loyer", renting: joker_renting_first_flat, payment_date: Time.new(2020, 3, 9, 8, 30, 0), month_rent: Date.new(2020,4,3).mon, year_rent: Date.new(2020,4,3).year, amount: 1100, category: "revenu")
Flow.create!(title: "Réparations", renting: stefan_renting_first_flat, payment_date: Time.new(2020, 3, 9, 8, 30, 0), month_rent: Date.new(2001,2,3).mon, year_rent: Date.new(2020,2,3).year, amount: 800, category: "dépense")
Flow.create!(title: "Loyer", renting: stefan_renting_first_flat, payment_date: Time.new(2020, 3, 9, 8, 30, 0), month_rent: Date.new(2001,2,3).mon, year_rent: Date.new(2020,2,3).year, amount: 800, category: "revenu")
Flow.create!(title: "Loyer", renting: joker_renting_first_flat, payment_date: Time.new(2020, 3, 9, 8, 30, 0), month_rent: Date.new(2001,2,3).mon, year_rent: Date.new(2020,2,3).year, amount: 900, category: "revenu")
Flow.create!(title: "Loyer", renting: joker_renting_first_flat, payment_date: Time.new(2020, 3, 9, 8, 30, 0), month_rent: Date.new(2001,2,3).mon, year_rent: Date.new(2020,2,3).year, amount: 700, category: "revenu")
Flow.create!(title: "Loyer", renting: joker_renting_first_flat, payment_date: Time.new(2020, 3, 9, 8, 30, 0), month_rent: Date.new(2001,2,3).mon, year_rent: Date.new(2020,2,3).year, amount: 700, category: "revenu")
Flow.create!(title: "Réparations", renting: joker_renting_first_flat, payment_date: Time.new(2020, 3, 9, 8, 30, 0), month_rent: Date.new(2001,2,3).mon, year_rent: Date.new(2020,2,3).year, amount: 66.50, category: "dépense")
puts puts "#{Flow.count} flows created"

puts "G O O D     L U C K      G U Y S"

