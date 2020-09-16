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
    @message.villager = current_user.villager

    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private
    def message_params
      params.require(:message).permit(:body, :villager_id)
    end
end
