require 'rails_helper'

RSpec.describe "Cooks", type: :request do
    describe "GET /ryoken/setup" do
        it "料研の登録ページアクセス" do
            get ryoken_setup_path
            expect(response).to have_http_status(200)
        end
    end
end
