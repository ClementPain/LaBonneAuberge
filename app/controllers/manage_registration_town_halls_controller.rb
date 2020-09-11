class ManageRegistrationTownHallsController < ApplicationController
  def new
  end

  def create
    if @village = Village.find_by(zipcode:params[:zipcode])
      @email = @village.email
      redirect_to new_town_hall_registration_path(email: @email), notice: "Veuillez renseigner un mot de passe"
    else
      redirect_to new_manage_registration_town_hall_path, alert: "Le zip code renseigné n'existe pas"
    end
  end
end
