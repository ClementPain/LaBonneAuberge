class Comment < ApplicationRecord
    belongs_to :villager
    belongs_to :event
    
end
