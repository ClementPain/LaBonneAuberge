class CommentsController < ApplicationController
  before_action :find_event
  before_action :find_comment, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_town_hall_or_user
  before_action :authenticate_author, except: [:new, :create, :index, :show]
  
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.villager = current_user.villager
    @comment.event = @event
    
    if @comment.save
      redirect_to event_path(@event), notice: "Le commentaire a bien été créé"
    else
      redirect_to new_event_comment_path, alert: "Certaines informations sont incorrectes"
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    
    if @comment.update(comment_params)
        redirect_to event_path(@event), notice: "votre commentaire est bien modifié"
    else
        redirect_to edit_comment_path(@event), alert: "Veuillez renseigner toutes les informations"
    end
  end

  def destroy
        
        @comment = Comment.find(params[:id])     
        @comment.destroy     
        redirect_to event_path(@comment.event_id), alert: "Le commentaire a bien été supprimé"
  end

  private
  
    def comment_params
        params.require(:comment).permit(:content)
    end

    def find_comment
        @comment = Comment.find(params[:id])
    end

    def find_event
      @event = Event.find(params[:event_id])
    end

    def authenticate_town_hall_or_user
      redirect_to new_user_session_path, alert: "Veuillez vous connecter" if !user_signed_in? && !town_hall_signed_in?
    end

    def authenticate_author
      if user_signed_in?
        redirect_to root_path, alert: "Vous n'avez pas accès à cette page" if current_user.villager!= @comment.villager
      end
    end
end
