class BasicController < ApplicationController

  def load_creds
    Jetsetmeapi::Config.dev_id = ENV["DEVID"]
    Jetsetmeapi::Config.app_id = ENV["APPID"]
  end

end