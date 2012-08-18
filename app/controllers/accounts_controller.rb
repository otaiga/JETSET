class AccountsController < ApplicationController
  before_filter :authenticate_user!, :validate_user_msisdn

  def index
    @country = User.find(current_user.id).country
  end

private

  def validate_user_msisdn
    @user = User.find(current_user.id)
    if @user.msisdn.nil?
      redirect_to new_auth_path
    else
      return true
    end 
  end
end
