class Villager < ApplicationRecord
    belongs_to :user
    has_one :village
    has_many :comments
end
