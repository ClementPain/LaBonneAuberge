class ForumsController < ApplicationController
    before_action :find_village
    
    def index
        @forum = Forum.find_by(village:@village, title:"Forum principal")
        @posts = ForumPost.select { |f| f.forum === @forum }
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

    def forum_params
        params.require(:forum).permit(:title)
    end
end
