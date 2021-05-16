class CommentsController < ApplicationController
    
    def create
        @comments = Comment.new(comment_params)
        @user = User.where(account_id: current_account.id)
        if @comments.save
            redirect_to cook_path(id: @comments.cookpost_id)
        else
            render :show
        end
    end


    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :cookpost_id)
    end
end
