require 'rails_helper'
require 'wercuba_helper'
module Mutations

  RSpec.describe CreateTaxi, type: :request do

    describe '.resolve' do
      include WercubaHelper::COMMON

      before(:each) do
        create_and_sign_in_user
        create_regions
      end


      it 'Creates one taxi' do
        expect do
          post '/graphql', params: { query: query(region1:@region1, region2:@region2) },
               headers: {"token": @user_token}
        end.to change { Taxi.count }.by(1)
      end
    end

    def query(region1:, region2:)
      <<~GQL
        mutation{
          createTaxi(
            inputData:{
              modelData:{
                title: "Carrito Salvaje"
                brand: "Audi"
                model: "sm 78"
                passengersCount: 5
                hourPrice: 98.0
                dayPrice: 87.7
                hourPriceWoDriver: 7
              },
              descriptions:[
                {language: "es", text:"El mejor carrito"},
                {language: "en", text:"Best Taxi"}
              ],
              transfers:[
                {from: #{region1.id}, to: #{region2.id}, adultPrice:89, childPrice:56},
                {from: #{region2.id}, to: #{region1.id}, adultPrice:67, childPrice:44}
              ]
            }
          ){
            id
            title
            hourPrice
            descriptions{
              language
              text
            }
            transfers{
              from {name}
              to {name}
            }
          }
        }
      GQL
    end

  end

end