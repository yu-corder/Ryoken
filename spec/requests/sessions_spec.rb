require 'rails_helper'

RSpec.describe "sessions", type: :request do
    before do
      @account = create(:account)
    end

    describe "sessiongs_controller" do
        it "ログイン画面の表示に成功すること" do
            get new_account_session_path
            expect(response).to have_http_status(200)
        end

        it "ログインする" do
          sign_in @account
          get root_path
          expect(response).to have_http_status(302)
        end

        it "ログアウト　リダイレクトのため302" do
          delete destroy_account_session_path
          expect(response).to have_http_status(302)
        end
    end
end