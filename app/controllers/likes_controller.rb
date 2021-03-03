class LikesController < ApplicationController
    

    def create
      @cookposts = Cookpost.find_by(id: params[:id])
      if @cookposts.user_id != current_account.id
        @like = Like.create(user_id: current_account.id, cookpost_id: params[:id])
      end
    end

    def destroy
        @cookposts = Cookpost.find_by(id: params[:id])
        @like = Like.find_by(user_id: current_account.id, cookpost_id: params[:id])
        if @like != nil
           @like.destroy
        end
    end

    
end
