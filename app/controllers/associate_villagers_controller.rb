class AssociateVillagersController < ApplicationController
    before_action :find_villager

    def new

    end

    def create
        if @village = Village.find_by(zipcode:params[:zipcode])
            if !@villager.village
              ValidationTownHall.create(village:@village, villager: @villager, message: params[:message])
              redirect_to villager_path(@villager), notice: "Une demande d'intégration a été envoyée au village #{@village.name}"
            else
              redirect_to villager_path(@villager), alert: "Vous êtes déjà intégré dans un village"
            end
        else
            redirect_to new_villager_associate_villager_path(@villager), alert: "Le code postal renseigné n'existe pas"
        end
    end

    private
    
    def find_villager
        @villager = current_user.villager
    end
end
