class CookpostsController < ApplicationController
    before_action :authenticate_account!
    def new
        @cookposts = Cookpost.new
        @cookposts.user_id = current_account.id
    end


    def create
        @cookposts = Cookpost.new
        @cookposts.user_id = current_account.id
        if request.post? then
            @cookposts = Cookpost.create cookposts_params
            redirect_to '/ryoken'
        end
    end

    private

    def cookposts_params
        params.require(:cookpost).permit(:cooking_name, :ingredients, :cooking_recipe, :user_id)
    end
end
