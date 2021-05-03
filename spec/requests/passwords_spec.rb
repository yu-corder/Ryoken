require 'rails_helper'

RSpec.describe "confirmations", type: :request do
    before do
        @account = create(:account)
    end

    describe "passwords_controller" do
        it "パスワード変更画面" do
            get new_account_password_path
            expect(response).to have_http_status(200)
        end

        it "パスワード作成" do
            post account_password_path
            expect(response).to have_http_status(200)
        end
    end
end