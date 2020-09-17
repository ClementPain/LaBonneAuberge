class ConversationsController < ApplicationController

  def index
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    @villagers = Villager.where.not(id: current_user.villager.id)
  end

  def create
    if Conversation.between(params[:sender_id], params[:receiver_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:receiver_id]).first
      redirect_to conversation_messages_path(conversation_id: @conversation.id)  
    else
      @conversation = Conversation.new(conversation_params)
      if @conversation.save
        redirect_to conversation_messages_path(conversation_id: @conversation.id)
        
      else
        redirect_to conversations_index_path, alert: "Une erreur est intervenue"
      end
    end
  end

  private
    def conversation_params
      params.permit(:sender_id, :receiver_id)
    end
end