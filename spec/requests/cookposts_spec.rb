require 'rails_helper'

RSpec.describe "Cookposts", type: :request do
    before do
      @cookpost = create(:cookpost)
    end

    describe "cookposts_controller" do
        it "料理投稿画面" do
            get cookposts_new_path
            expect(response).to have_http_status(302)
        end

        it "料理投稿作成" do
            post cookposts_path
            expect(response).to have_http_status(302)
        end

        it "料理投稿編集画面" do
            get edit_cookpost_path(id: @cookpost.id)
            expect(response).to have_http_status(302)
        end

        it "料理投稿編集" do
            put cookpost_path(id: @cookpost.id)
            expect(response).to have_http_status(302)
        end
    end
end
