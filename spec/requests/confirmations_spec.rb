require 'rails_helper'

RSpec.describe "confirmations", type: :request do
    before do
        @account = create(:account)
    end

    describe "confirmations_controller" do
        it "メール再送信画面" do
            get new_account_confirmation_path
            expect(response).to have_http_status(200)
        end

        it "メール再送信エラー画面" do
            get account_confirmation_path
            expect(response).to have_http_status(200)
        end

        it " account_confirmation POST" do
            post account_confirmation_path
            expect(response).to have_http_status(200)
        end
    end
end