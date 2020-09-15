class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create

    @comment = Comment.new('villager_id' => Villager.find_by(first_name: params[:villager_first_name]).id,
                      'event_id' => params[:event_id],
                     'content' => params[:comment_content])
    
      if @comment.save
        redirect_to new_event_comment_path(@comment.event_id), notice: "Le commentaire a bien été créé"
        
        
      else
        redirect_to new_event_comment_path, alert: "Certaines informations sont incorrectes"
      end

    
      
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  
    def comment_params
        params.require(:comment).permit(:content)
    end

    def find_comment
        @comment = Comment.find(params[:id])
    end
end
