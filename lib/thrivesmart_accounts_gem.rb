require 'rubygems'
require 'rest_client'

module ThrivesmartAccounts
  module Agent
    THRIVESMART_ACCOUNTS_URL = "https://accounts.thrivesmart.com"
    
    def login_from_token
      token = cookies[:auth_token]
      unless token
        redirect_to THRIVESMART_ACCOUNTS_URL + "/login"
      end
      begin 
        RestClient.post THRIVESMART_ACCOUNTS_URL + '/validate-token/' + token
      rescue
        redirect_to THRIVESMART_ACCOUNTS_URL + "/login"
      end
    end
  end
  
  module User
    #pending
  end
end
