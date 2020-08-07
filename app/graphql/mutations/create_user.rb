module Mutations
  class CreateUser < BaseMutation
    class AuthProviderSignupData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInput, required: false
    end

    argument :first_name, String, required: true
    argument :auth_provider, AuthProviderSignupData, required: false
    argument :last_name, String, required: false
    argument :id_token, String, required: false
    type Types::UserType

    def resolve(first_name: nil, auth_provider: nil, last_name: nil, id_token: nil)
      if id_token
        firebase = FirebaseHelper::FirebaseClient.new
        token = {'idToken' => id_token}
        firebase_user_json = firebase.getAccountInfo(token)

        user = User.create!(
            first_name: first_name,
            last_name: last_name,
            email: firebase_user_json['email'],
            password: firebase_user_json['passwordHash']
        )

      else
        user = User.create!(
            first_name: first_name,
            last_name: last_name,
            email: auth_provider&.[](:credentials)&.[](:email),
            password: auth_provider&.[](:credentials)&.[](:password)
        )
      end
      user
    end
  end
end
