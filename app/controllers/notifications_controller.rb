class NotificationsController < ApplicationController

  def retieve_notification
    @msisdn = params[:msisdn]
    @country = params[:country]
    @user = User.where(:msisdn => @msisdn).first
    @user.country = @country
    @user.save

    render :json => {:message => "success"}, :status => 200
  end

end
