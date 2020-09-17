# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

Event.destroy_all
Message.destroy_all
Villager.destroy_all
User.destroy_all
Category.destroy_all

Faker::Config.locale = 'fr'

10.times do
  Event.create(start_date:Faker::Date.between(from: '2021-01-01',to: '2021-12-31'), 
    duration:rand(5..100)*5,
    title:Faker::Movies::HarryPotter.quote, 
    description:Faker::GreekPhilosophers.quote, 
    price:rand(1..1000),
    location:Faker::Address.street_address,
    village_id: Village.all.sample.id
    )    
end

i = Event.first.id
Event.find(i+0).event_picture.attach(io: open('https://i.ytimg.com/vi/KAQo84A7Hkc/maxresdefault.jpg'), filename:'#{i}_event_image.jpg')
Event.find(i+1).event_picture.attach(io: open('https://i.ytimg.com/vi/8FNpAjB9oP0/maxresdefault.jpg'), filename:'#{i}_event_image.jpg')
Event.find(i+2).event_picture.attach(io: open('https://i.ytimg.com/vi/8FNpAjB9oP0/maxresdefault.jpg'), filename:'#{i}_event_image.jpg')
Event.find(i+3).event_picture.attach(io: open('http://i.ytimg.com/vi/nULRHc8fqgU/maxresdefault.jpg'), filename:'#{i}_event_image.jpg')
Event.find(i+4).event_picture.attach(io: open('https://i.ytimg.com/vi/c-pm5ID3QtA/hqdefault.jpg'), filename:'#{i}_event_image.jpg')
Event.find(i+5).event_picture.attach(io: open('http://i.ytimg.com/vi/9FBj0lIxd7o/hqdefault.jpg'), filename:'#{i}_event_image.jpg')
Event.find(i+6).event_picture.attach(io: open('https://www.francethisway.com/images/places/gorbio.jpg'), filename:'#{i}_event_image.jpg')
Event.find(i+7).event_picture.attach(io: open('https://img.ev.mu/images/zooms/1143/440x290/5.jpg'), filename:'#{i}_event_image.jpg')
Event.find(i+8).event_picture.attach(io: open('https://i.ytimg.com/vi/8zKbHBYaVnQ/hqdefault.jpg'), filename:'#{i}_event_image.jpg')
Event.find(i+9).event_picture.attach(io: open('https://www.francethisway.com/images/places/domfront.jpg'), filename:'#{i}_event_image.jpg')

Category.create(title:"Associatif", display:true)
Category.create(title:"Immobilier", display:true)
Category.create(title:"Reprise d'un commerce", display:true)
Category.create(title:"Emploi", display:true)


Offer.create(title:"Un dispositif participatif pour comprendre la vacance commerciale et initier des actions de redynamisation du centre-ville",
  description:"Sous-préfecture du département du Vaucluse (région Provence-Alpes-Côte d'Azur) située à 55 km d'Aix-en-Provence, Apt compte environ 12 000 habitants, au sein d’une intercommunalité de 30 000 habitants. Cité romaine installée au bord du Calavon, elle est connue pour ses fabriques de fruits confits, sa faïencerie, et son cadre naturel exceptionnel au cœur du Parc Naturel Régional du Luberon.  

 
  Les raisons de l'intervention de Villages Vivants
  
  Sollicité par la communauté de communes du Pays d’Apt Luberon suite à sa prise de compétence “Commerces” et un programme FISAC*, Villages Vivants a proposé une étude de diagnostic de la vacance commerciale ainsi qu’une démarche participative, permettant de partager un état des lieux du centre-ville d’Apt et surtout d’impulser une dynamique collective !
  
  Face au départ de commerces en périphéries, aux vitrines vides (40 commerces vacants recensés dans le centre), à un sentiment général de déqualification, le diagnostic a aussi permis de souligner les atouts du cœur d’Apt et de proposer des actions pour les valoriser. Riche de patrimoine et d’histoire, mais aussi d’entrepreneurs et d’un tissu associatif mobilisés pour porter des idées nouvelles, ce centre-ville a déjà amorcé sa transformation !
  
  *Fonds d'intervention pour la sauvegarde de l'artisanat et du commerce",
  village:Village.all.sample,
  category:Category.all.sample
)

Offer.last.offer_picture.attach(io: open('https://i.ytimg.com/vi/KAQo84A7Hkc/maxresdefault.jpg'), filename:'#{Offer.last.id}_offer_image.jpg')

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
    
  )
end