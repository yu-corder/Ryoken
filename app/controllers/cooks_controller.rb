class CooksController < ApplicationController
    before_action :authenticate_account!, only: [:index]

    def index
      @users = User.all
    end

    def main
    end
end
