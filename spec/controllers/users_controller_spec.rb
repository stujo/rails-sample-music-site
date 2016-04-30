require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #dashboard" do 
  	context "No User" do
	    it "should redirect" do
	  		get :dashboard
	  		expect(response).to redirect_to root_path
	  	end
  	end
  end

end
