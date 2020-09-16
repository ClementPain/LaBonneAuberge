class LikesController < ApplicationController
before_action :find_event
before_action :find_like, only: [:destroy]

    def create
        event.likes.create(user_id: current_user.villager.id)
            if already_liked?
              flash[:notice] = "Tu ne peux pas liker plusieurs fois"
            else
              @event.likes.create(user_id: current_user.villager.id)
            end
            redirect_to event_path(@event)
    end

    def destroy
        if !(already_liked?)
          flash[:notice] = "Tu ne peux pas unlike"
        else
          @like.destroy
        end
        redirect_to event_path(@event)
    end

    private 

    def find_event
        @event = Event.find(params[:event_id])
    end

    def already_liked?
        Like.where(user_id: current_user.villager.id, event_id:params[:event_id]).exists?
    end

    def find_like
        @like = @post.likes.find(params[:id])
    end

end