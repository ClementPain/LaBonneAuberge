class VillagersController < ApplicationController
    def show
        @villager = Villager.find(params[:id])
    end

  

    def edit
    end

    def update
    end
end
