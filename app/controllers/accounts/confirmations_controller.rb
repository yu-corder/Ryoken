# frozen_string_literal: true

class Accounts::ConfirmationsController < Devise::ConfirmationsController
  skip_before_action :redirect_to_ryoken_setup
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  #protected

  # The path used after resending confirmation instructions.
  #def after_resending_confirmation_instructions_path_for(resource_name)
    #users_new_path
  #end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end
