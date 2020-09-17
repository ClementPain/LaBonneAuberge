class ForumPostComment < ApplicationRecord
    belongs_to :villager
    belongs_to :forum_post

    validates :content, presence: true, length: { in: 1..400 }
end
