require 'rest_client'

module ThrivesmartAccounts
  module Agent
    THRIVESMART_ACCOUNTS_URL = "http://localhost:3000"
    
    def login_from_token
      token = cookies[:auth_token]
      unless token
        redirect_to "#{THRIVESMART_ACCOUNTS_URL}/login"
      else
        begin 
          RestClient.get "#{THRIVESMART_ACCOUNTS_URL}/validate-token/#{token}"
        rescue
          redirect_to "#{THRIVESMART_ACCOUNTS_URL}/login"
        end
      end
    end
  end
  
  #user.get
  def user
    RestClient::Resource.new "#{THRIVESMART_ACCOUNTS_URL}/profile"
  end
  
end
