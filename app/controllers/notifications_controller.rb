class NotificationsController < ApplicationController

  def retieve_notification
    posted =  JSON.parse(request.body.read.as_json)
    @auth_key = posted["auth_key"]
    @country = posted["dialing_code"]
    @iso_code = posted["iso_3366_1"]
    #terrible - will remove later
    puts "received code : #{@iso_code}"
    @user = User.find_by_auth_key(@auth_key)
    @user.country = @country
    @user.save

    render :json => {:message => "success"}, :status => 200
  end

end
