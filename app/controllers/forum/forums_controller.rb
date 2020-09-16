class ForumsController < ApplicationController
    before_action :find_village
    before_action :find_forum, only: [:edit, :update, :destroy, :show]

    
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
end
