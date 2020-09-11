class TownHallsController < ApplicationController
  def show
    @village = Village.find_by(email:current_town_hall.email)
    @events_today = Event.select { |e| e.village === @village && e.start_date === Date.today }
    @events_to_come = Event.select { |e| e.village === @village && e.start_date > Date.today }
    @events_passed = Event.select { |e| e.village === @village && e.start_date < Date.today }
  end
end
