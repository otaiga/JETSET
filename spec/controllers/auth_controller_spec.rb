require 'spec_helper'

describe AuthsController do
  before(:each) do
    create_user
    sign_in @user  
  end

  describe "new auth when signed-in" do

    it "should be possible to route to auth page" do
      get :new
      response.should be_success
    end
  end

  describe "create auth when signed-in" do

    it "should be possible to request authorisation" do
      Jetsetmeapi.should_receive(:get_auth_token).with(given_msisdn).and_return(given_token)
      post :create, {:number => given_msisdn}
      response.should redirect_to auth_confirm_path(:token => given_token)
    end
  end

  describe "Access confirm page auth when signed-in" do

    it "should be possible to access confirm page" do
      get :confirm
      response.should be_success
    end
  end

  describe "Confirm auth when signed-in" do

    it "should be possible to confirm authorisation" do
      Jetsetmeapi.should_receive(:get_auth_key).with(given_pin, given_token).and_return(given_auth_key)
      post :confirm_pin, {:pin => given_pin, :token => given_token, :number => given_msisdn}
      User.last.msisdn.should == given_msisdn
      User.last.auth_key.should == given_auth_key
      response.should redirect_to account_path
    end
  end

end