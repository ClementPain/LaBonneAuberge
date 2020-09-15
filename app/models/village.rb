class Village < ApplicationRecord
    has_one :town_hall
    has_many :events
    has_one_attached :village_avatar

    has_many :forums, dependent: :destroy

    # lien avec la table villager (profils utilisateurs)
    has_many :villagers
    has_many :users, through: :villagers

    validates :email, presence: true, uniqueness: true, length: { in: 6..50 }
    validates :name, presence: true, uniqueness: true, length: { in: 2..40 }
    validates :zipcode, presence: true, length: {is: 5 }
end
