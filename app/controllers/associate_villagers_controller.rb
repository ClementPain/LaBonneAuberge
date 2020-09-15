class AssociateVillagersController < ApplicationController
    before_action :find_villager

    def new

    end

    def create
        if @village = Village.find_by(zipcode:params[:zipcode])
            if !@villager.village
              @villager.update(village:@village)
              redirect_to villager_path(@villager), notice: "Vous êtes maintenant associé au village #{@village.name}"
            else
              redirect_to villager_path(@villager), alert: "Vous êtes déjà associé à un village"
            end
        else
            redirect_to new_villager_associate_villager_path(@villager), alert: "Le zip code renseigné n'existe pas"
        end
    end

    private
    
    def find_villager
        @villager = current_user.villager
    end
end
