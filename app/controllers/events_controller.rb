class EventsController < ApplicationController
    before_action :authenticate_town_hall!, except: [:index, :show]

    before_action :find_event, only: [:edit, :update, :destroy, :show]
    before_action :find_author_town_hall, only: [:edit, :update, :destroy]

    def index

        if user_signed_in? && current_user.village
            @events = Event.order('start_date DESC').select { |e| e.start_date >= Date.today && current_user.village.zipcode[0,2] === e.village.zipcode[0,2] }
        elsif town_hall_signed_in?
            @events = Event.order('start_date DESC').select { |e| e.start_date >= Date.today && Village.find_by(email:current_town_hall.email).zipcode[0,2] === e.village.zipcode[0,2] }
        else
            @events = Event.order('start_date DESC').select { |e| e.start_date >= Date.today }
        end

        if params[:search] || params[:search_zipcode]
            @events = Event.order('start_date DESC').search(params[:search], params[:search_zipcode])
        else
            @events = Event.all.order('start_date DESC')
        end
    end
  
    def show
        @comments = []
        
        Comment.order('created_at DESC').each do |comment|
            if @event.id == comment.event_id
                @comments << comment
            end
        end
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

    def find_author_town_hall
        redirect_to root_path, alert: "Vous n'avez pas accès à cette page" if current_town_hall.village != @event.village
    end    
end