class AuthsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @user = User.find(current_user.id)
  end

  def create
    @msisdn = params[:number]
    @token = Jetsetmeapi.get_auth_token(@msisdn)
    unless @token.kind_of?(Hash)
      redirect_to auth_confirm_path({:token => @token})
    else
      flash.now[:error] = "Oops! - There was an issue registering your number : #{@token[:error]}"
      render :new
    end
  end

  def confirm
    @user = User.find(current_user.id)
    @token = params[:token]
  end

  def confirm_pin
    @user = User.find(current_user.id)
    @token = params[:token]
    @pin = params[:pin]
    @msisdn = params[:number]
    @auth_key = Jetsetmeapi.get_auth_key(@pin, @token)
    if @auth_key
      @user.update_attributes(:msisdn => @msisdn, :auth_key => @auth_key)
      redirect_to account_path
    else
      render :confirm_pin
    end
  end

end
