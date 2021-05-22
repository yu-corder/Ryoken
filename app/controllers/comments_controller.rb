class CommentsController < ApplicationController
    
    def create
        @comments = Comment.new(comment_params)
        @user = User.where(account_id: current_account.id)
        if @user[0] == nil
            redirect_to cook_path(id: @comments.cookpost_id)
        else
            if @comments.save
                redirect_to cook_path(id: @comments.cookpost_id)
            else
                flash[:notice] = 'エラーが発生しました。NGワードが含まれている場合や文字が入力されてない場合はコメントできません。'
                redirect_to cook_path(id: @comments.cookpost_id)
            end
        end
    end

    def destroy
        @comments = Comment.find(params[:id])
        if @comments.user_id != current_account.id
            redirect_to cook_path(id: @comments.cookpost_id)
        else
            @comments.destroy
            flash[:notice] = 'コメント削除しました。'
            redirect_to cook_path(id: @comments.cookpost_id)
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :cookpost_id)
    end
end
