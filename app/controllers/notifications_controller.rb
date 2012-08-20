class NotificationsController < ApplicationController

  def retieve_notification
    posted = JSON.parse(params)
    @msisdn = posted[:msisdn]
    @country = posted[:country]
    @user = User.where(:msisdn => @msisdn).first
    @user.country = @country
    @user.save

    render :json => {:message => "success"}, :status => 200
  end

end
