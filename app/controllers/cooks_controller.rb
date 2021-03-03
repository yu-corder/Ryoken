class CooksController < ApplicationController
    skip_before_action :redirect_to_ryoken_setup, only: :main

    def index
      @cookposts = Cookpost.all
    end

    def main
    end
end
