class Villager < ApplicationRecord
    belongs_to :user
    has_one :village
end
