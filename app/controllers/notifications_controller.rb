class NotificationsController < ApplicationController

  def retieve_notification
    @msisdn = params[:msisdn]
    @country = params[:country]
    @user = User.where(:msisdn => @msisdn).first

    #save something to show we had push.

    render :json => {:message => "success"}, :status => 200
  end

end
