class ApplicationController < ActionController::Base

    before_action :redirect_to_ryoken_setup
    private

    def redirect_to_ryoken_setup
        redirect_to ryoken_setup_path unless account_signed_in?
    end
end
