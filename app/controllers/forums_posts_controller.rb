class ForumsPostsController < ApplicationController
    before_action :find_village_and_forum
    before_action :find_post, only: [:edit, :update, :destroy]

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

    def edit

    end

    def update
        if @post.update(post_params)
            redirect_to village_forum_path(@village, @forum), notice: "Votre post a bien été mises à jour"
        else
            redirect_to edit_village_forum_forums_post_path(@village, @forum, @post), alert: "Veuillez renseigner toutes les informations"
        end
    end

    def destroy
        @post.delete
        redirect_to village_forum_path(@village, @forum), alert: "Le post a bien été supprimé"
    end

    private

    def find_village_and_forum
        @village = Village.find(params[:village_id])
        @forum = Forum.find(params[:forum_id])
    end

    def find_post
        @post = ForumPost.find(params[:id])
    end

    def post_params
        params.require(:forum_post).permit(:content)
    end
end