# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  layout :resolve_layout

  private

    def after_sign_out_path_for(_resource)
      # "/users/sign_in"
      new_user_session_path
    end

    def resolve_layout
      # if controller_name == 'landing_pages'
      #   'landing_page'
      # elsif controller_name == 'sessions' || controller_name == 'registrations' || controller_name == 'passwords' || controller_name == 'confirmations'
      #   'login'
      # else
      #   # layout_overrides[controller_name.to_sym][action_name.to_sym] || "application"
      #   'application'
      # end
      if controller_name == 'sessions' || controller_name == 'registrations' || controller_name == 'passwords' || controller_name == 'confirmations'
        'login'
      else
        'application'
      end
    end
end
