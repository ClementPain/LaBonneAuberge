class VillagersController < ApplicationController
before_action :find_villager, only: [:edit, :update, :destroy, :show]

    def show

    end

    def edit

    end

    def update

        if @villager.update(villager_params)
            redirect_to villager_path(@villager), notice: "#{@villager.first_name}, les informations ont bien été mises à jour"
        else
            redirect_to edit_villager_path(@villager), alert: "Veuillez renseigner toutes les informations"
        end
    end

    
    private

    def villager_params
        params.require(:villager).permit(:first_name, :last_name, :description, :date_of_birth, :villager_picture)
    end

    def find_villager
        @villager = Villager.find(params[:id])
    end
end

