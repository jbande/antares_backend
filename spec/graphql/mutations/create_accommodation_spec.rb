require 'rails_helper'
require 'wercuba_helper'
module Mutations

  RSpec.describe CreateAccommodation, type: :request do
    describe '.resolve' do
      include WercubaHelper::COMMON
      before(:each) do
        create_and_sign_in_user
      end


      it 'Create one accommodation' do
        expect do
          post '/graphql', params: { query: query(name: "Casa bella", price: 223.5) },
               headers: {"token": @user_token}
        end.to change { Accommodation.count }.by(1)
      end
    end

    def query(name:, price:)
      <<~GQL
        mutation {
          createAccommodation(
            inputData: {
              modelData:{
                name: "#{name}"
                price: #{price}
              },
              descriptions:[
                {language: "es", text: "Hermosa Casa"},
                {language: "en", text: "Beautifull House"}
              ]
            }
          ){
            id
            name
            price
            descriptions{
              language
              text
            }
          }
        }
      GQL
    end


    def mutation_create_user(first_name:, last_name:, email:, password:)
      <<~GQL
         mutation{
         createUser(
           firstName: "#{first_name}"
           lastName: "#{last_name}"
           authProvider:{
             credentials: {
               email: "#{email}"
               password: "#{password}"
             }
           }
         ){
           id
           firstName
           lastName
         }
       }
      GQL
    end

    def mutation_sign_in_user(email:, password:)
      <<~GQL
         mutation{
           signinUser(
             credentials: {
               email: "#{email}",
               password: "#{password}"
             }
           ){
             token
             user {
               id
             }
           }
         }
      GQL

    end
    # mutation {
    #   createAccommodation(
    #     accommodation:{
    #       accommodationData:{
    #         name: "Casa Fernandez"
    #         price: 45
    #       }
    #       descriptions:[{
    #         text: "Mansion Fernandez"
    #         language:"es"
    #       },
    #       {
    #         text: "Fernandez residence"
    #         language: "en"
    #       }
    #       ]
    #     }
    #   ){
    #     id
    #     name
    #   }
    # }

  end

end