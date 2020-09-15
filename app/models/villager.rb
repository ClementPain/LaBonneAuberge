class Villager < ApplicationRecord
    belongs_to :user
    has_one :village
    has_many :comments
    has_one_attached :villager_picture
end
