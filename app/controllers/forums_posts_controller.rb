class ForumsPostsController < ApplicationController
    before_action :find_village_and_forum
    
    def new
        @post = ForumPost.new
    end

    def create
        @post = ForumPost.new(post_params)
        @post.villager = current_user.villager
        @post.forum = @forum

        if @post.save
            redirect_to village_forums_path(@village), notice: "Le message a bien été créé ! Bien joué petit génie !"
        else
            redirect_to new_village_forum_forums_path(@village, @forum), alert: "Veuillez renseigner toutes les informations"
        end
    end

    private

    def find_village_and_forum
        @village = Village.find(params[:village_id])
        @forum = Forum.find(params[:forum_id])
    end

    def post_params
        params.require(:forum_post).permit(:content)
    end
end