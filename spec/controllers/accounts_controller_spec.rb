require 'spec_helper'

describe AccountsController do

  before(:each) do
    create_user
    sign_in @user  
  end

  describe "get index" do

    it "should have index page returned on valid authed login" do
      with_valid_auth 
      get :index
      response.should be_success
    end

    it "should redirect to auth path if no valid auted login" do
      get :index
      response.should redirect_to new_auth_path
    end
  end

end
