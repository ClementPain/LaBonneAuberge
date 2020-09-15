class ForumPost < ApplicationRecord
    belongs_to :forum
    belongs_to :villager

    validates :content, presence: true, length: { in: 1..400 }
end
