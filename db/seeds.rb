# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def attach_photo_flat(string, flat)
  file = URI.open(string)
  flat.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
end

roxane = User.create!(first_name: "Roxane", last_name: "Haddad", email: "roxane.haddad@gmail.com", password: "123412", phone_number: "0664784489")
flat = Flat.new(name: "Mon flat", address: "4 rue des Prêtres Saint-Séverin, 75005, Paris", description: "23m2, 5ème étage, deux pièces", monthly_price: "783", visible: true, rented: false, user: roxane)
attach_photo_flat("https://images.unsplash.com/photo-1529408632839-a54952c491e5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", flat)
attach_photo_flat("https://images.unsplash.com/photo-1451153378752-16ef2b36ad05?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", flat)
flat.save
