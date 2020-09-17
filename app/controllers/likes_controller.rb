class LikesController < ApplicationController
before_action :find_event
before_action :find_like, only: [:destroy]

    def create
        Like.create(villager_id: current_user.villager.id)
            
    end

    private 

    def find_event
        @event = Event.find(params[:event_id])
    end

    def already_liked?
        Like.where(villager_id: current_user.villager.id, event_id:params[:event_id]).exists?
    end

    def find_like
        @like = @event.likes.find(params[:id])
    end

end