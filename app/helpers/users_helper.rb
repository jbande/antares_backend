module UsersHelper
  module Access
    def get_current_user

      # We are not user firebase login cause is blocked to cuba
      #cur_user = fire_base_user

      cur_user = current_user

      unless cur_user
        cur_user = api_current_user
      end

      cur_user
    end

    def api_current_user
      return unless request.headers.key? 'Authorization'
      return if request.headers['Authorization'].blank?
      return if request.headers['Authorization'] == 'null'

      res = request.headers['Authorization'].split(' ')

      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token = crypt.decrypt_and_verify res[1]

      user_id = token.gsub('user-id:', '').to_i
      User.find user_id
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      nil
    end

    def current_user
      return unless session[:token]

      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token = crypt.decrypt_and_verify session[:token]

      user_id = token.gsub('user-id:', '').to_i
      User.find user_id
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      nil
    end

    def fire_base_user
      return unless request.headers.key? 'uid'
      return if request.headers['uid'].blank?
      return if request.headers['uid'] == 'null'

      # We can double check by requesting user data given a idToken provided by the front-end
      # firebase = FirebaseHelper::FirebaseClient.new
      # token = request.headers['idToken']
      # firebase_user_json = firebase.getAccountInfo(token)

      User.find_by_uid request.headers['uid']

    rescue ActiveSupport::MessageVerifier::InvalidSignature
      nil
    end

  end
end