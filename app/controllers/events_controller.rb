class EventsController < ApplicationController
    # before_action :authenticate_town_hall!, only: [:new, :create, :destroy]
    load_and_authorize_resource

    def index
        @events = Event.all
    end
  
    def show
        authorize! :read, Event
        @event = Event.find(params[:id])
    end
    
    def new 
        @event = Event.new
    end 
  
    def create
        @event = Event.new(event_params)
        @event.village = Village.find_by(email:current_town_hall.email)

        if @event.save
            redirect_to events_path, notice: "L'événement #{@event.title} a bien été créé ! Bien joué petit génie !"
        else
            redirect_to new_event_path
        end
    end
    
    private
  
    def event_params
        params.require(:event).permit(:title, :event_picture, :start_date, :description, :duration, :price, :event_picture, :location)
    end
end