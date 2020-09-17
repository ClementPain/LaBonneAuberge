class Comment < ApplicationRecord
    belongs_to :villager
    belongs_to :event
    has_many :likes, dependent: :destroy
end
