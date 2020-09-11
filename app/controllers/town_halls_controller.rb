class TownHallsController < ApplicationController
  def show
    @village = Village.find_by(email:current_town_hall.email)
  end
end
