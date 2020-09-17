# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

Comment.destroy_all
ForumPost.destroy_all
Event.destroy_all
Message.destroy_all
Villager.destroy_all
User.destroy_all
Category.destroy_all
Offer.destroy_all

Faker::Config.locale = 'fr'

10.times do
  Event.create(start_date:Faker::Date.between(from: '2021-01-01',to: '2021-12-31'), 
    duration:rand(5..100)*5,
    title:Faker::GreekPhilosophers.quote, 
    description:Faker::Movies::HarryPotter.quote, 
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

Offer.create(title:"Une auberge coopérative pluri-activités",
  description:"Boffres, village d'Ardèche

  Boffres est un village de 700 habitants en Ardèche, en région Auvergne Rhône-Alpes. Située à une vingtaine de kilomètres de Valence, Boffres est un ancien village féodal du XIIe siècle entourés de châtaigniers et de forêts de pins.
  
   
  Les raisons de l'intervention de Villages Vivants
  
  Comme tout le territoire ardéchois, Boffres souffre d'un grand déficit de commerce et de service. Il n'existe plus qu'un seul commerce : un tabac-presse en vente qui ne trouve pas de repreneur.
  
   
  Le début de l'histoire
  
  Ce sont Malika, Ludovic, Marco et Antoine qui sont venus frapper à la porte de Villages Vivants. Leur projet : ouvrir une auberge-épicerie-restaurant en Scop dans un bien immobilier qu'ils ont eux-même trouvé. Ce bien, c'est l'auberge du village, lieu historique et emblématique. Leur souci : financer l'achat.",
  village:Village.all.sample,
  category:Category.all.sample
)

Offer.last.offer_picture.attach(io: open('https://villagesvivants.com/assets/Uploads/_resampled/ResizedImageWzYwMCwzMDBd/2-images-auberge2.jpg'), filename:'#{Offer.last.id}_offer_image.jpg')

Offer.create(title:"Amorcer une action citoyenne pour sensibiliser les habitants et usagers au pouvoir d'agir et à la coopération",
  description:"Crest, au centre de la vallée de la Drôme

  Située dans le département de la Drôme en région Auvergne-Rhône-Alpes, la ville de Crest est située à 25 km au sud-est de Valence. Commune d'environ 8300 habitants, Crest est notamment connue pour sa tour, donjon médiéval classé monument historique.
  
   
  Les raisons de l'intervention de Villages Vivants
  
  C'est à Crest, dans la vallée de la Drôme que Villages Vivants est né. Crest, dont le centre-ville a connu l'émergence de nombreuses initiatives citoyennes, comme le café ludique associatif Archijeux, né en 2006, ou entrepreneuriales, comme le tiers-lieu L'Usine Vivante. Mais la rue Archinard, en plein cœur de Crest, où Villages Vivants a implanté ses quartiers, est également fortement touchée par le phénomène des boutiques vides et du turn-over des activités.",
  village:Village.all.sample,
  category:Category.all.sample
)

Offer.last.offer_picture.attach(io: open('https://www.francethisway.com/images/places/domfront.jpg'), filename:'#{Offer.last.id}_offer_image.jpg')

Offer.create(title:"Construire une vision d’avenir pour le centre-ville de Joyeuse en impliquant habitants et acteurs du territoire",
  description:"Joyeuse, un village atypique sur 3 étages

  Village atypique construit sur 3 étages, Joyeuse doit son nom, d'après la légende, à l'épée de Charlemagne qui y livra bataille. Avec ses voisines Rosières et Lablachère, Joyeuse constitue un centre pour la communauté de communes du Pays de Beaume Drobie (8600 habitants), abritant notamment un collège et une maison médicale.
  Au cœur des Cévennes Ardéchoises, et malgré sa réputation touristique portée par un tissu artisanal dynamique, Joyeuse subit comme de nombreuses communes rurales la désertification de son cœur commerçant.
   
  Les raisons de l'intervention de Villages Vivants
  
  Alors que la communauté de communes venait de prendre la compétence “Commerces” et s’apprêtait à mettre en place son Plan Local d’Urbanisme Intercommunal (le premier d’Ardèche), celle-ci a décidé de mobiliser Villages Vivants pour questionner la place du cœur de Joyeuse et son devenir, en partenariat avec la commune. Associant des réflexions en terme d’urbanisme et de développement économique, Villages Vivants a proposé une méthode impliquant de près les usagers et acteurs du centre-ville. La Banque des Territoires, reconnaissant l’aspect innovant de la démarche, a proposé un cofinancement de 50% de l’opération.
  
   
  Comprendre les dessous de la vacance commerciale
  
  Pendant 9 mois, Villages Vivants a mené des enquêtes et des entretiens pour cartographier et évaluer la vacance commerciale. Retrouver et rencontrer les propriétaires, les sensibiliser, visiter leurs locaux, identifier les commerçants cherchant à céder leur activité et des exemples de locaux ayant trouvé repreneur sont des phases essentielles à l'établissement d'un diagnostic et de préconisations, portant tant sur l’immobilier que les sur les conditions de commercialisation des locaux.
  
  Parallèlement, une enquête sur le centre-ville a été menée auprès des habitants de Joyeuse et des environs. L'offre commerciale répond-t-elle à leurs attentes ? Comment et pourquoi viennent-ils en centre-ville ? Quels potentiels de développement identifier pour quels secteurs d’activité ?",
  village:Village.all.sample,
  category:Category.all.sample
)

Offer.last.offer_picture.attach(io: open('https://villagesvivants.com/assets/Uploads/_resampled/ResizedImageWzUwMCwzNzVd/20190206-201248.jpg'), filename:'#{Offer.last.id}_offer_image.jpg')

Offer.create(title:"Démarche participative pour ouvrir des commerces et services de proximité.",
  description:"Loriol-sur-Drôme

  Commune de la Drôme d’environ 6 500 habitants, Loriol-sur-Drôme a pour particularité de s’être très fortement développée à partir des années 70. L’étendue de la partie urbanisée de la commune s’est multipliée par huit en 16 ans.
  
  Les raisons de l’intervention de Villages Vivants
  
  Touchée par le phénomène de la multiplication de boutiques abandonnées et la perte de lien social, Loriol constate que les porteurs de projets ont des difficultés à rester, à l’exception des commerces innovants tournés vers la production locale (boucherie en circuit court, café des parents, maison de l’enfance...). Un signal positif entendu par la mairie, prête à s’emparer fermement du problème.
  
  Dans le cadre du contrat de ville 2017-2020, Loriol et ses partenaires historiques ont engagé plusieurs actions en faveur de la cohésion sociale, du cadre de vie, du développement économique et de l’emploi.
  Villages Vivants est intervenu sur 2 cycles de projet :
  
  - Citoyens : exprimez-vous !
  Soutien à L’union des commerçants (ACAIL)
  pour recenser les besoins de la population.
  
  - Vitrines : embellissez-nous !
  Valorisation des locaux vides
  Période : mai - décembre 2017",
  village:Village.all.sample,
  category:Category.all.sample
)

Offer.last.offer_picture.attach(io: open('https://villagesvivants.com/assets/Uploads/_resampled/ResizedImageWzUwMCwzNzVd/Loriol-Local-N66.JPG'), filename:'#{Offer.last.id}_offer_image.jpg')

# User/Villager

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
    village_id:Village.all.sample.id
    
  )
  Villager.last.villager_picture.attach(io: open('http://blogdailyherald.com/wp-content/uploads/2014/10/wallpaper-for-facebook-profile-photo.jpg'), filename:'#{Villager.last.id}_villager_image.jpg')
end

# Comments
50.times do
  Comment.create(
    content:Faker::Movies::StarWars.quote,
  villager_id: Villager.all.sample.id,
  event_id: Event.all.sample.id
  )    
end

# Forum_post
50.times do
  @villager = Villager.all.sample
  ForumPost.create(
    content:Faker::TvShows::GameOfThrones.quote,
    villager_id: @villager.id,
    forum_id: Forum.find_by(village:@villager.village).id
  )
end