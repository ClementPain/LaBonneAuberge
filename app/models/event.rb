class Event < ApplicationRecord
    before_create :start_date_not_before_time_now

    has_one_attached :event_picture
    has_many :attendances, dependent: :destroy
    has_many :users, through: :attendances
    belongs_to :village

	validates :start_date, presence: true 
    validate :start_date_not_before_time_now
    validates :duration, presence: true, :numericality => { greater_than: 0 }
    validate :duration_minutes 
	validates :title, presence: true, length: { in: 5..140, message: "Un titre fait entre 5 et 140 caractères" }
	validates :description, presence: true, length: { in: 5..1000, message: "Un description fait entre 10 et 1000 caractères" }
	validates :price, presence: true 
	validates :location, presence: true 


    def self.search(search, search_zipcode)
        @results = []
        @search = self.where("title ILIKE ?", "%#{search}%").or(self.where("description ILIKE ?", "%#{search}%"))
        @search.each { |s| @results << s if s.village.zipcode.include? search_zipcode }
        results = @results
    end

	def start_date_not_before_time_now #Méthode pour ne pas entrer une date antérieur à la date de debut 
	    if self.start_date < Date.today
            errors.add(:start_date, "la date ne doit pas etre dans le passé")
        end  
    end

    def duration_minutes #met l'entre de duree de l'event en positif
        unless duration.present? && duration > 0
            errors.add(:duration, "la durée doit etre positive")
        end
     end
end
