class OffersController < ApplicationController
    before_action :authenticate_town_hall!, only: [:new, :create, :destroy]
    

    before_action :find_offer, only: [:edit, :update, :destroy, :show]

    def index
        @offers = Offer.all
    end

    private

    def offer_params
        params.require(:offer).permit(:title, :event_picture, :start_date, :description, :duration, :price, :event_picture, :location)
    end

    def find_offer
        @offer = Offer.find(params[:id])
    end
end
