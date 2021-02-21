class CooksController < ApplicationController
    before_action :authenticate_account!, only: [:index]

    def index
      @cookposts = Cookpost.all
    end

    def main
    end
end
