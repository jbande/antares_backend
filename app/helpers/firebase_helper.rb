require 'firebase'
require 'jsonclient'
module FirebaseHelper
  class FirebaseClient

    def initialize(base_uri='https://www.googleapis.com/identitytoolkit/v3/relyingparty')
      if base_uri !~ URI::regexp(%w(https))
        raise ArgumentError.new('base_uri must be a valid https uri')
      end
      base_uri += '/' unless base_uri.end_with?('/')
      @request = HTTPClient.new({:base_url => base_uri,
                                 :default_header => {'Content-Type' => 'application/json'}
      })

    end

    def getAccountInfo(token)
      path = 'getAccountInfo?key=AIzaSyCM_uIRMDyzaq1PFydSg82f2j_aen0dzTc'
      #response = @request.request('post', path, {:body => token, :follow_redirect => true})
      response = @request.post(path, token.to_json, :follow_redirect => true)
      parsed_response = JSON.parse(response.body)
      parsed_response['users'][0]
    end

  end
end