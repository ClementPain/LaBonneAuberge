class EventsController < ApplicationController
    before_action :authenticate_town_hall!, only: [:new, :create, :destroy]
    load_and_authorize_resource

    before_action :find_event, only: [:edit, :update, :destroy, :show]

    def index
        @events = Event.all
    end
  
    def show
        authorize! :read, Event
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
            redirect_to new_event_path, alert: "Veuillez renseigner toutes les informations"
        end
    end
    
    def edit

    end

    def update
        if @event.update(event_params)
            redirect_to event_path(@event), notice: "Les informations de #{@event.title} ont bien été mises à jour"
        else
            redirect_to edit_event_path(@event), alert: "Veuillez renseigner toutes les informations"
        end
    end

    def destroy
        @event.delete
        redirect_to town_hall_path(current_town_hall.id), alert: "L'évènement a bien été supprimé"
    end

    private
  
    def event_params
        params.require(:event).permit(:title, :event_picture, :start_date, :description, :duration, :price, :event_picture, :location)
    end

    def find_event
        @event = Event.find(params[:id])
    end
end