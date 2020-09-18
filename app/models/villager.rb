class Villager < ApplicationRecord
    belongs_to :user
    belongs_to :village, optional: true
    
    has_one_attached :villager_picture

    has_many :comments, dependent: :destroy
    has_many :offer_comments, dependent: :destroy

    has_many :likes, dependent: :destroy

    has_many :forum_posts, dependent: :destroy
    has_many :forum_post_comments, dependent: :destroy
end
