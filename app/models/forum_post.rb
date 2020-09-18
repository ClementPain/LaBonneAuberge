class ForumPost < ApplicationRecord
    belongs_to :forum
    belongs_to :villager

    has_many :forum_post_comments

    validates :content, presence: true, length: { in: 1..400 }
end
