require 'spec_helper'

describe User do
  before (:each) do
    create_user
  end

  describe "creating a new user" do

    it "should be able to create a user with valid attributes" do
      @user.save.should == true
    end

    it "should not be able to create a user with invalid attributes" do
      @user.update_attributes(:email => "adawr2e23r.com")
      @user.save.should == false
    end
  end

  describe "deleting a user" do

    it "should delete user" do
      expect { @user.destroy }.to change(User, :count).by(-1)
    end
  end

end

