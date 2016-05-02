class ApplicationController < ActionController::Base

  include CanCan::ControllerAdditions

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def authenticate_user!
    authorize! :access, nil
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :authenticated?

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def authenticated?
    current_user != nil
  end

  def sign_in(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def log_out
    @current_user = nil
    session.delete :user_id
  end
end
