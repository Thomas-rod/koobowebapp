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

puts "creating User"

roxane = User.new(first_name: "Roxane", last_name: "Haddad", phone_number: "0664784489", email: "roxane.haddad@gmail.com", password: "123412")
roxane.save
john = User.create!(first_name: "Jonathan", last_name: "Courdavault", phone_number: "0778381974", email: "jo.courdavault@gmail.com", password: "567856")
john.save
thomas = User.create!(first_name: "Thomas", last_name: "Rodier", phone_number: "0668489169", email: "rodiert17@gmail.com", password: "432143")
thomas.save
mao = User.create!(first_name: "Maodo", last_name: "Diop", phone_number: "0663906049", email: "maodod1@gmail.com", password: "876587")
mao.save
puts "#{User.count} users have beeen crerated"

puts "Flats seeding..."
num = roxane.id - 1
4.times do
  num += 1
  address = Faker::Address.full_address
  description = Faker::Lorem.sentence(word_count: 25)
  monthly_price = Faker::Number.within(range: 500..1500)
  Flat.create!(address: address, description: description, monthly_price: monthly_price.to_i, user_id: num)
end
puts "#{Flat.count} flats have been created"
puts "Now we creating 4 Shedules by flats"
puts "........."
 roxane.flats.each do |flat|
  Schedule.create!(start:Time.new(2020, 3, 2, 8, 0, 0, "+02:00"),end:Time.new(2020, 3, 2, 8, 30, 0, "+02:00"),flat_id:flat.id)
  Schedule.create!(start:Time.new(2020, 3, 2, 8, 30, 0, "+02:00"),end:Time.new(2020, 3, 2, 9, 0, 0, "+02:00"),flat_id:flat.id)
  Schedule.create!(start:Time.new(2020, 3, 2, 9, 0, 0, "+02:00"),end:Time.new(2020, 3, 2, 9, 30, 0, "+02:00"),flat_id:flat.id)
  Schedule.create!(start:Time.new(2020, 3, 2, 9, 30, 0, "+02:00"),end:Time.new(2020, 3, 2, 10, 0, 0, "+02:00"),flat_id:flat.id)
end

 john.flats.each do |flat|
  Schedule.create!(start:Time.new(2020, 3, 2, 13, 0, 0, "+02:00"),end:Time.new(2020, 3, 2, 13, 30, 0, "+02:00"),flat_id:flat.id)
  Schedule.create!(start:Time.new(2020, 3, 2, 13, 30, 0, "+02:00"),end:Time.new(2020, 3, 2, 14, 0, 0, "+02:00"),flat_id:flat.id)
  Schedule.create!(start:Time.new(2020, 3, 2, 14, 0, 0, "+02:00"),end:Time.new(2020, 3, 2, 14, 30, 0, "+02:00"),flat_id:flat.id)
  Schedule.create!(start:Time.new(2020, 3, 2, 14, 30, 0, "+02:00"),end:Time.new(2020, 3, 2, 15, 0, 0, "+02:00"),flat_id:flat.id)
end
 thomas.flats.each do |flat|
  Schedule.create!(start:Time.new(2020, 3, 2, 7, 0, 0, "+02:00"),end:Time.new(2020, 3, 2, 7, 30, 0, "+02:00"),flat_id:flat.id)
  Schedule.create!(start:Time.new(2020, 3, 2, 8, 30, 0, "+02:00"),end:Time.new(2020, 3, 2, 9, 0, 0, "+02:00"),flat_id:flat.id)
  Schedule.create!(start:Time.new(2020, 3, 2, 9, 0, 0, "+02:00"),end:Time.new(2020, 3, 2, 9, 30, 0, "+02:00"),flat_id:flat.id)
  Schedule.create!(start:Time.new(2020, 3, 2, 9, 30, 0, "+02:00"),end:Time.new(2020, 3, 2, 10, 0, 0, "+02:00"),flat_id:flat.id)
end
 mao.flats.each do |flat|
  Schedule.create!(start:Time.new(2020, 3, 2, 17, 0, 0, "+02:00"),end:Time.new(2020, 3, 2, 17, 30, 0, "+02:00"),flat_id:flat.id)
  Schedule.create!(start:Time.new(2020, 3, 2, 17, 30, 0, "+02:00"),end:Time.new(2020, 3, 2, 18, 0, 0, "+02:00"),flat_id:flat.id)
  Schedule.create!(start:Time.new(2020, 3, 2, 18, 0, 0, "+02:00"),end:Time.new(2020, 3, 2, 18, 30, 0, "+02:00"),flat_id:flat.id)
  Schedule.create!(start:Time.new(2020, 3, 2, 18, 30, 0, "+02:00"),end:Time.new(2020, 3, 2, 19, 0, 0, "+02:00"),flat_id:flat.id)
end

puts "you have now 4 schedules by flats "
puts "total schedules = #{Schedule.count}"
puts "G O O D     L U C K      G U Y S"




