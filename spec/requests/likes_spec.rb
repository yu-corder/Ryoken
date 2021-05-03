require 'rails_helper'

RSpec.describe "Likes", type: :request do

    before do
      @like = create(:like)
    end
    
    describe "likes_controller" do
        it "GET /mylikes" do
            get mylikes_path
            expect(response).to have_http_status(302)
        end

        it "POST /likes/:id" do
            post like_path(id: @like.id)
            expect(response).to have_http_status(302)
        end

        it "DELETE /likes/:id" do
            delete like_path(id: @like.id)
            expect(response).to have_http_status(302)
        end
    end
end
