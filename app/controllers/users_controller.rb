class UsersController < ApplicationController
    layout 'cooks'
    before_action :search_params, only: [:index, :search]

    def index
      @user = User.where(account_id: current_account.id)
      @cookposts = Cookpost.where(user_id: current_account.id).order('created_at desc')
      render :layout => 'ryoken'
    end

    def new
      @user = User.where(account_id: current_account.id)
      if @user[0] == nil
        @user = User.new
        @user.account_id = current_account.id
      else
        redirect_to '/users'
      end
    end
    
    def create
      @user = User.new
      @user.account_id = current_account.id
      if request.post? then
        @user = User.create user_params
        redirect_to '/'
      end
    end

    def edit
      @user = User.find params[:id]
      if @user.account_id != current_account.id
        redirect_to '/users'
      end
    end

    def update
      @user = User.find params[:id]
      if request.patch? then
        @user = User.update user_params
        redirect_to users_path
      end
    end
    
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to '/ryoken/setup'
    end
    

    private
    def user_params
        params.require(:user).permit(:nickname, :profile, :account_id)
    end

    def search_params
      @q = Cookpost.order('created_at desc').ransack(params[:q])
    end
end
