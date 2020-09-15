class ForumsController < ApplicationController
    before_action :find_village
    
    def index
        @forum = Forum.find_by(village:@village, title:"Forum principal")
        @posts = ForumPost.find_by(forum:@forum)
        @posts.order("created_at DESC") if !@posts.nil?
    end

    private

    def find_village
        @village = Village.find(params[:village_id])
    end
end
