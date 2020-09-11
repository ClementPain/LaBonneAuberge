require 'rubygems'
require 'open-uri'
require 'nokogiri'

class VillagesController < ApplicationController
    before_action :authenticate_town_hall!, only: [:new, :create, :destroy]
    skip_before_action :verify_authenticity_token, :only => :update


    def edit
        if current_town_hall.email === Village.find(params[:id]).email
            @village = Village.find(params[:id])
        else
            redirect_to root_path, alert: "Vous n'avez pas accès à cette page"
        end
    end

    def update
        @village = Village.find(params[:id])
        
        if @village.update(village_params)
            redirect_to town_hall_path(@village), notice: "Les informations de #{@village.name} ont bien été mises à jour"
        else
            redirect_to edit_village_path(@village), alert: "Veuillez renseigner toutes les informations"
        end
    end

    def index
        @town_hall_name = []
    end

    def new
            
        # if !zipcode.nil? #vérifier qu'un zipcode a bien été entré par l'utilisateur
        #     if Village.find_by(zipcode:params[:zipcode]) #vérifier que le zipcode renseigné existe
        #         @zipcode_village = []
        #         Village.select { |town| town.zipcode === params[:zipcode] }.each { |town| @zipcode_village << town }
            
        #     else
        #         redirect_to new_village_path, alert: "Le zip code renseigné n'existe pas"
        #     end
        # else
        #     @zipcode_village = []
        #     @email = ""
        # end
  
    end

    def create #scrapping pour créer les mairies
        page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/cantal.html"))
        tab = page.xpath('//td[@width="206"]//a[text()]')
        @town_hall_name = []      

        tab.each do |town|
            town_name = town.text.titleize
            town_mail = get_townhall_email(town).text.downcase
            town_zipcode = get_townhall_zipcode(town).text.chars.last(5).join
            
            if this_village = Village.find_by(name: town_name)
                this_village.update(email: town_mail)
            else
                Village.create(name: town_name, email: town_mail, zipcode: town_zipcode)
            end
        end
        
        redirect_to villages_path
    end    

    private
    
    # scrapping
    def get_townhall_email(name)
        townhall_name = name['href'].delete_prefix '.'
        page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com#{townhall_name}"))
        page.xpath('//section[@class="well section-border"]/div[@class="container"]/table[@class="table table-striped table-mobile mobile-primary round-small"]//tr[@class="txt-primary tr-last"]/td[text()[contains(., "@")]]')
    end

    def get_townhall_zipcode(name)
        townhall_name = name['href'].delete_prefix '.'
        page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com#{townhall_name}"))
        page.xpath('//div[@class="col-md-12 col-lg-10 col-lg-offset-1"]/h1')
    end
    # fin méthode scrapping

    def village_params
        params.require(:village).permit(:email, :description, :village_avatar)
    end
end
