require 'rails_helper'
require 'wercuba_helper'
require 'support/api/schemas/schema_matcher'
module Mutations

  RSpec.describe CreateTour, type: :request do
    describe '.resolve' do
      include WercubaHelper::COMMON
      before(:each) do
        create_and_sign_in_user
      end


      it 'Create one tour' do
        expect do
          post '/graphql', params: { query: query(tittle: "Kamikase bitch")},
               headers: {"token": @user_token}
        end.to change { Tour.count }.by(1)

        expect(response).to match_response_schema("tour")
      end
    end

    def query(tittle:)
      <<~GQL
        mutation {
          createTour(
            inputData: {

              modelData: {
                title: "#{tittle}"
                startDate: "2020-08-10"
                endDate: "2020-08-13"
                description: "Some description"
                duration: 3
                priceAdults: 150
                priceKids: 40
              },

              tourDays: [
                {tittle: "Binevenida",
                 dayNumber: 1
                 descriptions: [
                  {language: "es", text:"Lindo recibimient"},
                  {language: "en", text: "Nice welcome"}]
                }
              ],

              tourIncludes:[
                {description: "Desayunos y Almuerzos"},
                {description: "Entradas a los lugares"}
              ],

              tourExcludes: [
                {description: "Traslado nocturno"},
                {description: "Seguro medico"}
              ],

              tourSuplements: [
                {description: "Cuarto single 300cuc"}
              ],

              tourPlus: [
                {description: "Visita a Vinales"}
              ],

              descriptions: [
                {language: "es", text: "Pasaremos 3 dias explorando toda la ciudad"},
                {language: "en", text: "Will spend 3 days exploring the city"}
              ]
            }
          ){
            id
            priceKids
            duration
            description
            tourDays {
              tittle
              dayNumber
              descriptions {
                language
                text
              }
            }

            descriptions {
              language
              text
            }

            tourIncludes {
              description
            }

            tourExcludes {
              description
            }

            tourPlus {
              description
            }

            tourSuplements {
              description
            }

          }
        }
      GQL
    end
  end
end