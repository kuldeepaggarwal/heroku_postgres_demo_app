class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :update]
  before_filter :load_resource, only: [:edit, :update]

  def edit; end

  def update
    if @user.update(user_params)
      reset_session
      flash[:notice] = 'You have successfully subscribed.'
      redirect_to root_path
    else
      render :edit
    end
  end

  private
    def load_resource
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:email)
    end
end
