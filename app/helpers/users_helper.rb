module UsersHelper
  module Access
    def get_current_user
      cur_user = fire_base_user

      unless cur_user
        cur_user = current_user
      end

      unless cur_user
        cur_user = api_current_user
      end

      cur_user
    end

    def api_current_user

      return unless request.headers.key? 'token'
      return if request.headers['token'].blank?
      return if request.headers['token'] == 'null'

      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token = crypt.decrypt_and_verify request.headers['token']

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
      return unless request.headers.key? 'idToken'
      return if request.headers['idToken'].blank?
      return if request.headers['idToken'] == 'null'

      firebase = FirebaseHelper::FirebaseClient.new
      token = request.headers['idToken']
      firebase_user_json = firebase.getAccountInfo(token)

      User.find_by_uid firebase_user_json['localId']

    rescue ActiveSupport::MessageVerifier::InvalidSignature
      nil
    end

  end
end