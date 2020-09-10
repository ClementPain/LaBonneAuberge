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
        @event.village = current_user.village
  
        if @event.save
            redirect_to events_path, notice: "L'événement #{@event.title} a bien été créé ! Bien joué petit génie !"
        else
            redirect_to new_event_path, alert: "Certaines informations sont incorrectes : la description doit faire au moins 20 caractères et la date doit être dans le futur. "
        end
    end
    
    private
  
    def event_params
        params.require(:event).permit(:title, :start_date, :description, :duration, :price, :event_picture, :location)
    end
end