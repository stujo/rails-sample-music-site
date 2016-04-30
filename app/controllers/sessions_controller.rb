class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)
    if @session.authenticate?
      # Assign to Session
      sign_in(@session.user)
      # Redirect
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit [:name, :password]
  end
end
