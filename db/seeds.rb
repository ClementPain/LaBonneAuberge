# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Event.destroy_all
Message.destroy_all
Villager.destroy_all
User.destroy_all
Category.destroy_all

Faker::Config.locale = 'fr'

3.times do
  Event.create(start_date:Faker::Date.between(from: '2021-01-01',to: '2021-12-31'), 
    duration:rand(5..100)*5,
    title:Faker::Games::Pokemon.name, 
    description:Faker::GreekPhilosophers.quote, 
    price:rand(1..1000),
    location:Faker::Nation.capital_city,
    village_id: Village.all.sample.id
    )    
end

Category.create(title:"Associatif", display:true)

User.create([
  {
    email: "mike.hayden@ga.co",
    password: "password",
    password_confirmation: "password",
  },{
    email: "jules@ga.co",
    password: "password",
    password_confirmation: "password",
  },{
    email: "jason@ga.co",
    password: "password",
    password_confirmation: "password",
  },{
    email: "ed@ga.co",
    password: "password",
    password_confirmation: "password",
  },{
    email: "will@ga.co",
    password: "password",
    password_confirmation: "password",
  },{
    email: "toni@ga.co",
    password: "password",
    password_confirmation: "password",
  },{
    email: "chetan@ga.co",
    password: "password",
    password_confirmation: "password",
  }
])

i = User.first.id
7.times do
  i+=1
  Villager.create(
    first_name:Faker::Name.first_name,
    last_name:Faker::Name.last_name,
    description:Faker::GreekPhilosophers.quote,
    date_of_birth:Faker::Date.between(from: '1950-09-23', to: '2014-09-25'),
    user_id:i,
    address:Faker::Address.street_name
  )
end