class MessagesController < ApplicationController
  

  def index
    @conversation = Conversation.find(params[:conversation_id])
    @messages = @conversation.messages

    @messages.where("villager_id != ? AND read = ?", current_user.id, false).update_all(read: true)

    @message = @conversation.messages.new
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.new(message_params)
    @message.villager_id = current_user.villager.id

    if @message.save
      redirect_to villager_conversation_messages_path(current_user.villager, @conversation)
    else
      redirect_to villager_conversation_messages_path(current_user.villager, @conversation), alert: "Le message n'a pas été envoyé"
    end
  end

  private
    def message_params
      params.require(:message).permit(:body)
    end
end
