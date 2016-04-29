class SessionsController < ApplicationController
  def new
  	@session = Session.new
  end

  def create
  	@session = Session.new(session_params)
    if @session.authenticate?
    	# Assign to Session
    	# Redirect
    	redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def session_params
  	params.require(:session).permit [:name, :password]
  end
end
