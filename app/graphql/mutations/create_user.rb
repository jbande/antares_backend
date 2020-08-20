module Mutations
  class CreateUser < BaseMutation
    class AuthProviderSignupData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInput, required: false
    end

    argument :first_name, String, required: true
    argument :auth_provider, AuthProviderSignupData, required: false
    argument :last_name, String, required: false
    argument :notification_token, String, required: false
    argument :id_token, String, required: false # Used for fire base login
    type Types::UserType

    def resolve(first_name: nil,
                auth_provider: nil,
                last_name: nil,
                notification_token: nil,
                id_token: nil
    )
      if id_token
        firebase = FirebaseHelper::FirebaseClient.new
        token = {'idToken' => id_token}
        firebase_user_json = firebase.getAccountInfo(token)

        user = User.create!(
            first_name: first_name,
            last_name: last_name,
            email: firebase_user_json['email'],
            password: firebase_user_json['passwordHash'],
            uid: firebase_user_json['localId'],
            notification_token: notification_token
        )

      else
        user = User.create!(
            first_name: first_name,
            last_name: last_name,
            email: auth_provider&.[](:credentials)&.[](:email),
            password: auth_provider&.[](:credentials)&.[](:password),
            notification_token: notification_token
        )
      end
      user
    end
  end

  class UpdateUser < BaseMutation

    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :preferred_language, String, required: false
    type Types::UserType

    def resolve(first_name: nil, last_name: nil, preferred_language: nil)

      current_user = context[:current_user]
      return unless current_user

      current_user.update_on_changes(first_name: first_name,
                                     last_name: last_name,
                                     preferred_language: preferred_language)
      current_user
    end
  end

end
