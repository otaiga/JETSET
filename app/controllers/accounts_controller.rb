class AccountsController < BasicController
  before_filter :authenticate_user!, :validate_user_msisdn, :load_creds

  def index
    @country = @user.country
  end

  def roaming
    response = Jetsetmeapi.get_customer_status(@user.auth_key)
    redirect_to account_path, :notice => response
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
