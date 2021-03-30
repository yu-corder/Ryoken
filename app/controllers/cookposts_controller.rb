class CookpostsController < ApplicationController
    layout 'cooks'
    

    def new
        @cookposts = Cookpost.new
        @cookposts.user_id = current_account.id
        @user = User.where(account_id: current_account.id)
    end


    def create
        @cookposts = Cookpost.new
        @cookposts.user_id = current_account.id
        if request.post? then
          @cookposts = Cookpost.create(cookposts_params)
          redirect_to '/'
        end
    end

    def edit
        @cookposts = Cookpost.find params[:id]
    end

    def update
        @cookposts = Cookpost.find params[:id]
        if request.patch? then
            @cookposts.update cookposts_params
            redirect_to '/users'
        end
    end 

    def destroy
        @cookposts = Cookpost.find(params[:id])
        @cookposts.destroy
        redirect_to '/users'
    end


    private

    def cookposts_params
        params.require(:cookpost).permit(:cooking_name, :ingredients, :cooking_recipe, :user_id, {images: []})
    end
end
