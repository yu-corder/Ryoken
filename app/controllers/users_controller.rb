class UsersController < ApplicationController
    layout 'cooks'
    before_action :search_params, only: [:index, :search, :show]

    def index
      @user = User.where(account_id: current_account.id)
      @cookposts = Cookpost.where(user_id: current_account.id).order('created_at desc').page params[:page]
      render :layout => 'ryoken'
    end

    def show
      @user = User.find params[:id]
      @cookposts = Cookpost.where(user_id: @user.id).order('created_at desc').page params[:page]
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
      @user = User.new(user_params)
      @user.account_id = current_account.id
      if @user.save
          redirect_to '/'
      else
          render action: :new
      end
    end

    def edit
      @user = User.find params[:id]
      if @user.account_id != current_account.id || current_account.email == 'example@example.com'
          redirect_to '/users'
      end
    end

    def update
      @user = User.find params[:id]
      if @user.update(user_params)
          redirect_to users_path
      else
          render action: :edit
      end
    end
    
    def destroy
      @user = User.find(params[:id])
      if @user.account_id != current_account.id || current_account.email == 'example@example.com'
          redirect_to '/users'
      else
          @user.destroy
          redirect_to '/ryoken/setup'
      end
    end
    

    private
    def user_params
        params.require(:user).permit(:nickname, :profile, :account_id)
    end

    def search_params
        @q = Cookpost.order('created_at desc').ransack(params[:q])
    end
end
