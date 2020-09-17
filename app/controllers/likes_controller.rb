class LikesController < ApplicationController
before_action :find_comment
before_action :find_like, only: [:destroy]

    def create
      @comment.event = @event
      if already_liked?
        flash[:notice] = "Tu ne peux pas liker plus d'une fois"
      else
        Like.create(villager_id: current_user.villager.id, comment:@comment)
      end
        redirect_to event_path(find_event)
    end

    def destroy
      if !(already_liked?)
        flash[:notice] = "Tu ne peux pas unlike"
      else
        @like.destroy
      end
      redirect_to event_path(find_event)
    end

    private 

    def find_comment
        @comment = Comment.find(params[:comment_id])
    end

    def already_liked?
        Like.where(villager_id: current_user.villager.id, comment_id:params[:comment_id]).exists?
    end

    def find_like
        @like = @comment.likes.find(params[:id])
    end

    def find_event
      @event = Event.find(params[:event_id])
    end

end