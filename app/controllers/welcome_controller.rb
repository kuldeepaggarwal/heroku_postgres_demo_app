class WelcomeController < ApplicationController
  before_filter :redirect_to_after_sign_in_path, if: :logged_in?, only: :show

  def show; end

  private
    def redirect_to_after_sign_in_path
      redirect_to after_sign_in_path and return
    end
end
