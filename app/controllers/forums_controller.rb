class ForumsController < ApplicationController
    before_action :authenticate_town_hall!, except: [:index, :show]
    
    before_action :find_village
    before_action :find_forum, only: [:edit, :update, :destroy, :show]
    before_action :authenticate_village
    
    def index
        @forum = Forum.find_by(village:@village, title:"Forum principal")
        @posts = @forum.forum_posts.order(created_at: :desc)
    end

    def show
        @posts = @forum.forum_posts.order(created_at: :desc)
    end
    
    def new
        @forum = Forum.new
    end

    def create
        @forum = Forum.new(forum_params)
        @forum.village = Village.find_by(email:current_town_hall.email)

        if @forum.save
            redirect_to village_forums_path, notice: "Le forum #{@forum.title} a bien été créé ! Bien joué petit génie !"
        else
            redirect_to new_village_forum_path, alert: "Veuillez renseigner toutes les informations"
        end
    end

    private

    def find_village
        @village = Village.find(params[:village_id])
    end

    def find_forum
        @forum = Forum.find(params[:id])
    end

    def forum_params
        params.require(:forum).permit(:title)
    end

    def authenticate_village
        if user_signed_in?
            redirect_to root_path, alert: "Vous n'avez pas accès à cette page" if current_user.village != @village

        elsif town_hall_signed_in?
            redirect_to root_path, alert: "Vous n'avez pas accès à cette page" if Village.find_by(email:current_town_hall.email) != @village
        
        else
            redirect_to new_user_session_path, alert: "Veuillez vous connecter"
        end
    end
end
