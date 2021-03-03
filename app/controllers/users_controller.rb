class UsersController < ApplicationController
    

    def index
      @user = User.where(account_id: current_account.id)
    end

    def new
      @user = User.new
      @user.account_id = current_account.id
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
end
