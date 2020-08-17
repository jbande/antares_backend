require 'rails_helper'
require 'wercuba_helper'
module Mutations

  RSpec.describe CreateAttraction, type: :request do
    describe '.resolve' do
      include WercubaHelper::COMMON
      before(:each) do
        create_and_sign_in_user
      end


      it 'Create one attraction' do
        expect do
          post '/graphql', params: { query: query(name: "EFE BAR") },
               headers: {"token": @user_token}
        end.to change { Attraction.count }.by(1)
      end
    end

    def query(name:)
      <<~GQL
        mutation {
          createAttraction(
            inputData:{
              modelData:{
                name:"#{name}"
                activities: [1,2,34]
                features:[4,5,6]
                hashTags:["Bailar y Gozar"]
                subdomainName:"efebar"
              }
              descriptions: [
                {language: "es" text:"Lindo Lugar"}
                {language: "en", text: "Nice Place"}
              ]
            }
          ){
            id
            name
            features
            activities
            hashTags
            descriptions{
              text
            }
          }
        }
      GQL
    end
  end

end