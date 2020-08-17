require 'rails_helper'
require 'wercuba_helper'
module Mutations

  RSpec.describe CreateRoom, type: :request do

    describe '.resolve' do
      include WercubaHelper::COMMON

      before(:each) do
        create_and_sign_in_user
        create_one_accommodation
      end


      it 'Creates one room' do
        expect do
          post '/graphql', params: { query: query(accommodation:@accommodation1)},
               headers: {"token": @user_token}
        end.to change { Room.count }.by(1)
      end
    end

    def query(accommodation:)
      <<~GQL
        mutation {
          createRoom(
            room:{
              accommodationId: #{accommodation.id},
              descriptions: [
                {language: "es", text: "Cuarto con dos camas"}
              ],
              roomData: {
                price: 90
                roomNumber: 1
              }
            }
          ){
            id
            price
            roomNumber
          }
        }
      GQL
    end
  end
end