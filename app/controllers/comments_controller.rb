class CommentsController < ApplicationController
    
    def create
        @comments = Comment.new(comment_params)
        @comments.user_id = current_account.id
        @user = User.where(account_id: current_account.id)
        if @comments.save
            redirect_to '/'
        else
            render :show
        end
    end
end
