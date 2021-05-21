class CookpostsController < ApplicationController
    layout 'cooks'
    

    def new
        @cookposts = Cookpost.new
        @user = User.where(account_id: current_account.id)
    end


    def create
        @cookposts = Cookpost.new(cookposts_params)
        @cookposts.user_id = current_account.id
        @user = User.where(account_id: current_account.id)
        if @cookposts.save
            redirect_to '/'
        else
            render :new
        end
    end

    def edit
        @cookposts = Cookpost.find params[:id]
        if @cookposts.user_id != current_account.id
            redirect_to '/users'
        end
    end

    def update
        @cookposts = Cookpost.find params[:id]
        if @cookposts.update(cookposts_params)
            redirect_to '/users'
        else
            render action: :edit
        end
    end  

    def destroy
        @cookposts = Cookpost.find(params[:id])
        if @cookposts.user_id != current_account.id
            redirect_to '/users'
        else
            @cookposts.destroy
            redirect_to '/users'
        end
    end


    private

    def cookposts_params
        params.require(:cookpost).permit(:cooking_name, :ingredients, :cooking_recipe, :user_id, {images: []})
    end
end
