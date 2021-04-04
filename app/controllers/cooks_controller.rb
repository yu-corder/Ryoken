class CooksController < ApplicationController
    skip_before_action :redirect_to_ryoken_setup, only: :main
    before_action :search_params, only: [:index, :show, :search]
    layout 'ryoken'
    
    def index
      @cookposts = Cookpost.all.order('created_at desc').page params[:page]
      
    end

    def show
      @cookposts = Cookpost.where(id: params[:id]) 
      @results = @q.result
    end

    def main
      render :layout => 'cooks'
    end

    def search 
      @results = @q.result.page params[:page]
    end

    private
    def search_params
      @q = Cookpost.order('created_at desc').ransack(params[:q])
    end
end
