class UsersController < ApplicationController
    before_action :authenticate_account!

    

    def new
      @user = User.new
      @user.account_id = current_account.id
    end
    
    def create
      @user = User.new
      @user.account_id = current_account.id
      if request.post? then
        @user = User.create user_params
        redirect_to '/ryoken'
      end
    end

    

    private
    def user_params
        params.require(:user).permit(:nickname, :profile, :account_id)
    end
end
