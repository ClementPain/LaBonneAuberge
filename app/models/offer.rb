class Offer < ApplicationRecord
    has_one_attached :offer_picture
    belongs_to :village
    belongs_to :category, optional: true
    has_many :offer_comments

	validates :title, presence: true, length: { in: 5..140, message: "Un titre fait entre 5 et 140 caractères" }
	validates :description, presence: true, length: { in: 10..1000, message: "Un description fait entre 10 et 1000 caractères" }

    def self.search(search, search_zipcode  )
        @results = []
        @search = self.where("title ILIKE ?", "%#{search}%").or(self.where("description ILIKE ?", "%#{search}%"))
        @search.each { |s| @results << s if s.village.zipcode.include? search_zipcode }
        results = @results
    end
end
