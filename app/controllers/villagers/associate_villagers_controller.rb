class AssociateVillagersController < ApplicationController
    before_action :authenticate_user!

    before_action :find_villager
    before_action :check_villager


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

    def check_villager
        if @villager.id != params[:villager_id].to_i
            redirect_to root_path, alert: "Vous ne pouvez pas accéder à cette page"
        end
    end
    
    def find_villager
        @villager = current_user.villager
    end
end
