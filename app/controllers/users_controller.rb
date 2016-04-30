class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    	# Assign to Session
    	sign_in(@user)
    	# Redirect
    	redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def dashboard
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:password,:name,:password_confirmation) 
  end

end
