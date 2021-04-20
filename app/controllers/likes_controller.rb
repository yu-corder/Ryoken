class LikesController < ApplicationController
    layout 'cooks'
    before_action :search_params, only: [:index]
    
    def index
        @likes = Like.where(user_id: current_account.id).page params[:page]
        render :layout => 'ryoken'
    end

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

    private

    def search_params
        @q = Cookpost.order('created_at desc').ransack(params[:q])
    end
    
end
