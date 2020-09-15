class ValidationTownHallsController < ApplicationController
    before_action :find_village_and_villager

    def create
        @villager.update(village:@village)
        ValidationTownHall.find_by(villager:@villager, village:@village).delete
        redirect_to town_hall_path(current_town_hall), notice: "Le villageois #{@villager.first_name} #{@villager.last_name} a été accepté au village !"
    end

    def destroy
        ValidationTownHall.find_by(villager:@villager, village:@village).delete
        redirect_to town_hall_path(current_town_hall), alert: "Le villageois #{@villager.first_name} #{@villager.last_name} n'a pas été accepté"
    end

    private

    def find_village_and_villager
        @village = Village.find_by(email:current_town_hall.email)
        @villager = Villager.find(params[:villager_id])
    end
end
