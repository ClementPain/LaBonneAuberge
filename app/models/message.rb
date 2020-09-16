class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :villager

  validates_presence_of :body, :conversation_id, :villager_id

  private
    def message_time
      created_at.strftime("%d/%m/%y at %l:%M %p")
    end
    
end

