require 'rails_helper'

RSpec.describe "Users", type: :request do
    before do
      @user = create(:user)
    end

    describe "users_controller" do
        it "ユーザープロフィール画面" do
            get users_path
            expect(response).to have_http_status(302)
        end

        it "ユーザー新規作成画面" do
            get users_new_path
            expect(response).to have_http_status(302)
        end

        it "ユーザー詳細画面" do
            get users_path(id: @user.id)
            expect(response).to have_http_status(302)
        end

        it "ユーザー編集画面" do
            get edit_user_path(id: @user.id)
            expect(response).to have_http_status(302)
        end

        it "ユーザー作成" do
            post users_path
            expect(response).to have_http_status(302)
        end

        it "ユーザー編集" do
            put user_path(id: @user.id)
            expect(response).to have_http_status(302)
        end

        it "ユーザー削除" do
            get user_path(id: @user.id)
            expect(response).to have_http_status(302)
        end
    end
end
