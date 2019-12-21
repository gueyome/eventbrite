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

user = User.create!(email: "admin@yopmail.com", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Movies::BackToTheFuture.quote, password: "password", password_confirmation: "password", is_admin: true)

6.times do |i|
  email1 = "user" + i.to_s + "@yopmail.com" 
  user = User.create!(email: email1, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Movies::BackToTheFuture.quote, password: "password", password_confirmation: "password", is_admin: false)
  event = Event.create!(start_date: Date.today+i+1, duration: 5000, title: Faker::DcComics.title, description: Faker::Movie.quote + Faker::Movie.quote + Faker::GreekPhilosophers.quote + Faker::GreekPhilosophers.quote + Faker::GreekPhilosophers.quote, price: Faker::Number.between(from: 5.00, to: 50.00), location: Faker::Address.city, admin_id: user.id, validated: true)
  attendance = Attendance.create!(user_id: User.all.sample.id, event_id: Event.all.sample.id, stripe_customer_id: i)
end




