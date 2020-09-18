class Villager < ApplicationRecord
    belongs_to :user
    belongs_to :village, optional: true
    has_many :comments
    has_one_attached :villager_picture
    has_many :likes, dependent: :destroy
end
