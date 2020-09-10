class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :destroy]
  
    def index
        @events = Event.all
    end
  
    def show
        @event = Event.find(params[:id])
    end
    
    def new 
        @event = Event.new
    end 
  
    def create
        @event = Event.new(event_params)

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