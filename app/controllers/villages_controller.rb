require 'rubygems'
require 'open-uri'
require 'nokogiri'


class VillagesController < ApplicationController
    def index
        @town_hall_name = []
    end

    def new

    end

    def create
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

    def name_field
        if Village.find_by(zipcode: params[:zipcode])
            redirect_to new_village_path
        else
            redirect_to new_town_hall_registration, alert: "Le zip code renseigné n'existe pas"
        end
    end
    

    private
    
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
end
