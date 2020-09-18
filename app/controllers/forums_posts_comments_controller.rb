class ForumsPostsCommentsController < ApplicationController
    before_action :find_village_forum_and_post
    before_action :find_comment, only: [:edit, :update, :destroy]
    before_action :authenticate_village

    def new
        @comment = ForumPostComment.new
    end

    def create
        @comment = ForumPostComment.new(comment_params)
        @comment.villager = current_user.villager
        @comment.forum_post = @post

        if @comment.save
            redirect_to village_forum_forums_post_path(@village, @forum, @post), notice: "Le message a bien été créé ! Bien joué petit génie !"
        else
            redirect_to new_village_forum_forums_post_forums_posts_comment(@village, @forum, @post), alert: "Veuillez renseigner toutes les informations"
        end
    end

    def edit

    end

    def update
        if @comment.update(comment_params)
            redirect_to village_forum_forums_post_path(@village, @forum, @post, @comment), notice: "Votre post a bien été mises à jour"
        else
            redirect_to edit_village_forum_forums_post_forums_posts_comment_path(@village, @forum, @post, @comment), alert: "Veuillez renseigner toutes les informations"
        end
    end

    def destroy
        @comment.delete
        redirect_to village_forum_forums_post_path(@village, @forum, @post), alert: "Le post a bien été supprimé"
    end


    private

    def find_village_forum_and_post
        @village = Village.find(params[:village_id])
        @forum = Forum.find(params[:forum_id])
        @post = ForumPost.find(params[:forums_post_id])
    end

    def find_comment
        @comment = ForumPostComment.find(params[:id])
    end

    def comment_params
        params.require(:forum_post_comment).permit(:content)
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
