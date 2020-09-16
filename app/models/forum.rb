class Forum < ApplicationRecord
  belongs_to :village
  has_many :forum_posts
  
  validates :title, presence: true, length: { in: 2..40 }

  def self.initialization(village)
    self.create(title: "Forum principal", village: village) if !village.id.nil?
  end
end
