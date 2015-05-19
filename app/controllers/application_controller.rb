class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
    def after_sign_in_path_for(resource = current_user)
      edit_user_path(resource)
    end
    alias_method :after_sign_in_path, :after_sign_in_path_for

    def authenticate_user!
      unless logged_in?
        flash[:alert] = 'You need to be logged in before performing the action.'
        redirect_to root_path
      end
    end

    def logged_in?
      session[:user_id]
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if logged_in?
    end
end
