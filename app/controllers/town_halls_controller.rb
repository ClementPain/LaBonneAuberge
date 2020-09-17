class TownHallsController < ApplicationController
  before_action :authenticate_town_hall!

  before_action :find_village
  before_action :auth_town_hall

  def show    
    @events_today = Event.select { |e| e.village === @village && e.start_date === Date.today }
    @events_to_come = Event.select { |e| e.village === @village && e.start_date > Date.today }
    @events_passed = Event.select { |e| e.village === @village && e.start_date < Date.today }

    @offers = Offer.select { |o| o.village === @village }
    @forums = Forum.select { |f| f.village === @village }
    @validations = ValidationTownHall.select { |v| v.village === @village }
  end

  private

  def find_village
    @village = Village.find_by(email:current_town_hall.email)
  end 

  def auth_town_hall
    redirect_to root_path, alert: "Vous n'avez pas accès à cette page" if Village.find_by(email:current_town_hall.email) != @village
  end
end
