module Mutations
  class CreateUser < BaseMutation
    class AuthProviderSignupData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInput, required: false
    end

    argument :first_name, String, required: true
    argument :auth_provider, AuthProviderSignupData, required: false
    argument :last_name, String, required: false
    type Types::UserType

    def resolve(first_name: nil, auth_provider: nil, last_name: nil)
      user = User.create!(
          first_name: first_name,
          last_name: last_name,
          email: auth_provider&.[](:credentials)&.[](:email),
          password: auth_provider&.[](:credentials)&.[](:password)
      )
      user
    end
  end
end
