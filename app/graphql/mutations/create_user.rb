module Mutations
  class CreateUser < BaseMutation
    #
    null true

    class AuthProviderSignupData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInput, required: false
    end

    argument :first_name, String, required: false
    argument :auth_provider, AuthProviderSignupData, required: false
    argument :last_name, String, required: false
    argument :notification_token, String, required: false
    argument :id_token, String, required: false # Used for fire base login

    #type Types::UserType

    field :token, String, null: true
    field :user, Types::UserType, null: true
    field :code, Int, null: true

    def resolve(first_name: nil,
                auth_provider: nil,
                last_name: nil,
                notification_token: nil,
                id_token: nil
    )

      user = User.find_by_email auth_provider&.[](:credentials)&.[](:email)

      unless user
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

        crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
        token = crypt.encrypt_and_sign("user-id:#{ user.id }")
        context[:session][:token] = token
        { user: user, token: token, code: 100}
      else
        # code 101 means email already taken
        { user: nil, token: nil, code: 101 }
      end


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
