require 'rails_helper'

RSpec.describe "registrations", type: :request do
    before do
      @account = create(:account)
    end

    describe "registrations_controller" do
        it "新規登録画面" do
            get new_account_registration_path
            expect(response).to have_http_status(200)
        end

        it "アカウント編集画面" do
          get edit_account_registration_path
          expect(response).to have_http_status(302)
        end

        it "アカウント作成" do
          post account_registration_path
          expect(response).to have_http_status(200)
        end

        it "アカウント削除" do
          delete account_registration_path
          expect(response).to have_http_status(302)
        end

        it "アカウント編集" do
          put account_registration_path
          expect(response).to have_http_status(302)
        end

        it "アカウント編集" do
          patch account_registration_path
          expect(response).to have_http_status(302)
        end
    end
end