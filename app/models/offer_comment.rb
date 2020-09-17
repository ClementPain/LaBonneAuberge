class OfferComment < ApplicationRecord
    belongs_to :villager
    belongs_to :offer
end
