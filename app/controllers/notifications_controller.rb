class NotificationsController < ApplicationController

  def retieve_notification
    posted =  JSON.parse(request.body.read.as_json)
    @auth_key = posted["auth_key"]
    @country = posted["country"]
    @user = User.find_by_auth_key(@auth_key)
    @user.country = @country
    @user.save

    render :json => {:message => "success"}, :status => 200
  end

end
