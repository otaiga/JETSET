def create_user
  @user = User.create(:email => "joe.bloggs@example.com", :password => given_password)
end

def given_user
  @user
end

def given_password
  "testingwithfakeuser"
end

def given_msisdn
  "447711223344"
end

def given_token
  "awdf44f4mne399nndlknat"
end

def given_pin
  "34532467"
end

def given_auth_key
  "bdbuIdkn3nnpPMSsw"
end

def with_valid_auth
  @user.update_attributes(:msisdn => given_msisdn)
end