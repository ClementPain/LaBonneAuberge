# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Event.destroy_all
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
Category.create(title:"Reprise de commerce", display:true)
Category.create(title:"Immobilier", display:true)