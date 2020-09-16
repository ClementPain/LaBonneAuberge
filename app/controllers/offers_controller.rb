class OffersController < ApplicationController
    before_action :authenticate_town_hall!, only: [:new, :create, :destroy]
    
    before_action :find_offer, only: [:edit, :update, :destroy, :show]


    def index
        @offers = Offer.all
        if params[:search]
            @offers = Offer.search(params[:search]).order("created_at DESC")
        else
            @offers = Offer.all.order('created_at DESC')
        end
    end

    def show

    end

    def new 
        @offer = Offer.new
    end 
  
    def create
        @offer = Offer.new(offer_params)
        @offer.village = Village.find_by(email:current_town_hall.email)
        @offer.category = Category.find(cat_params[:category])

        if @offer.save
            redirect_to offers_path, notice: "Le projet #{@offer.title} a bien été créé ! Bien joué petit génie !"
        else
            redirect_to new_offer_path, alert: "Veuillez renseigner toutes les informations"
        end
    end
    
    def edit

    end

    def update
        if @offer.update(offer_params)
            redirect_to offer_path(@offer), notice: "Les informations de #{@offer.title} ont bien été mises à jour"
        else
            redirect_to edit_offer_path(@offer), alert: "Certaines informations renseignées ne sont pas correctes"
        end
    end

    def destroy
        @offer.delete
        redirect_to town_hall_path(current_town_hall.id), alert: "Le projet a bien été supprimé"
    end

    def search
        query = params[:search]
        results = Offer.where('title LIKE ?', "%#{query}%")
        if params[:filter] == 'Filtre'
            @products = results
        else
            symbol = params[:filter.gsub(//, '_').downcase!.to_sym]
            @products = results.where(symbol => true)
        end
    end

    private

    def offer_params
        params.require(:offer).permit(:title, :description, :offer_picture)
    end

    def cat_params
        params.require(:offer).permit(:category)
    end

    def find_offer
        @offer = Offer.find(params[:id])
    end
end
