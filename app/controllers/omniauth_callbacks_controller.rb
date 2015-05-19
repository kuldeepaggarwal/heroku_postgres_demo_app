class OmniauthCallbacksController < ApplicationController
  def all_providers
    user = User.find_for_oauth(auth_params)

    if user.persisted?
      set_session(user)
      redirect_to after_sign_in_path_for(user)
    else
      flash[:error] = user.errors.full_messages
      redirect_to root_path
    end
  end

  private
    def auth_params
      env["omniauth.auth"]
    end

    def set_session(user)
      session[:user_id] = user.id
    end
end
