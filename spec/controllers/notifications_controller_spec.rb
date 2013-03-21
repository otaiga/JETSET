require 'spec_helper'

describe NotificationsController do

  it "should be able to parse the correct notification and save country" do
    create_user
    given_user.update_attributes(auth_key: given_auth_key)
    body = {auth_key: given_auth_key, dialing_code: "33", iso_3366_1: "FR", timestamp: "2012-01-01T12:37:46+01:00"}
    @request.env['RAW_POST_DATA'] = body.to_json
    post :retieve_notification
    given_user.reload
    given_user.country.should == "33"
    JSON.parse(response.body)["message"].should == "success"
    @request.env.delete('RAW_POST_DATA')
  end

end
