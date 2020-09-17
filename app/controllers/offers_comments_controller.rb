class OffersCommentsController < ApplicationController
  before_action :find_offer
  before_action :find_comment, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_town_hall_or_user
  before_action :authenticate_author, except: [:new, :create, :index, :show]
  
  
  def index
   
  end

  def new
    @comment = OfferComment.new
  end

  def create
    
    @comment = OfferComment.new(comment_params)
    @comment.villager = current_user.villager
    @comment.offer = @offer
    

    if @comment.save
      redirect_to offer_path(@offer), notice: "Le commentaire a bien été créé"
    else
      redirect_to new_offer_offers_comment_path, alert: "Certaines informations sont incorrectes"
    end

  end

  def show
  end

  def edit
  end

  def update

    if @comment.update(comment_params)
        redirect_to offer_path(@offer), notice: "votre commentaire est bien modifié"
    else
        redirect_to edit_offer_offers_comment_path(@offer), alert: "Veuillez renseigner toutes les informations"
    end
  end

  private
  
    def comment_params
        params.require(:offer_comment).permit(:content)
    end

    def find_comment
        @comment = OfferComment.find(params[:id])
    end

    def find_offer
      @offer = Offer.find(params[:offer_id])
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
