class Comment < ApplicationRecord
    belongs_to :villager
    belongs_to :event
    belongs_to :main_comment, class_name: "Comment", optional: true
    
end
