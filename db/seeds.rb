# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Attendance.destroy_all
User.destroy_all
Event.destroy_all

20.times do |i|
  email1 = "user" + i.to_s + "@yopmail.com" 
  user = User.create!(email: email1, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Movies::BackToTheFuture.quote, password: "password", password_confirmation: "password")
  event = Event.create!(start_date: Date.today+i+1, duration: 5000, title: "Evenement " + i.to_s, description: Faker::Movie.quote + Faker::Movie.quote, price: 200, location: Faker::Address.city, user_id: user.id)
  attendance = Attendance.create!(user_id: User.all.sample.id, event_id: Event.all.sample.id, stripe_customer_id: i)
end




