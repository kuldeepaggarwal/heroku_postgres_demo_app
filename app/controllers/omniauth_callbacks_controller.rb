class OmniauthCallbacksController < ApplicationController
  def all_providers
    user = User.find_for_oauth(auth_params)

    if user.persisted?
      flash[:notice] = 'You have successfully subscribed'
    else
      flash[:error] = user.errors.full_messages
    end
    redirect_to root_path
  end

  private
    def auth_params
      env["omniauth.auth"]
    end
end
