class ConversationsController < ApplicationController
  before_action :authenticate_user!


  def index
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    @villagers = Villager.where.not(id: current_user.villager.id)
  end

  def create
    if Conversation.between(params[:sender_id], params[:receiver_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:receiver_id]).first
      redirect_to villager_conversation_messages_path(current_user.villager.id,conversation_id: @conversation.id)  
    else
      @conversation = Conversation.new(conversation_params)
      if @conversation.save
        redirect_to villager_conversation_messages_path(current_user.villager.id, conversation_id: @conversation.id)
        
      else
        redirect_to villager_conversations_path(current_user.villager.id), alert: "Une erreur est intervenue"
      end
    end
  end

  private
    def conversation_params
      params.permit(:sender_id, :receiver_id)
    end

    def authenticate_this_user
      if current_user.villager != Villager.find(params[:villager_id])
        redirect_to root_path, alert: "Vous n'avez pas accès à cette page"
      end
    end
end