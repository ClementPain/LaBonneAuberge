class Offer < ApplicationRecord
    has_one_attached :offer_picture
    belongs_to :village
    belongs_to :category

	validates :title, presence: true, length: { in: 5..140, message: "Un titre fait entre 5 et 140 caractères" }
	validates :description, presence: true, length: { in: 10..1000, message: "Un description fait entre 10 et 1000 caractères" }

    def self.search(search)
        where("title ILIKE ?", "%#{search}%")
        where("description ILIKE ?", "%#{search}%")
    end
end
