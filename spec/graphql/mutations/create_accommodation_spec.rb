require 'rails_helper'

module Mutations

  RSpec.describe CreateAccommodation, type: :request do
    describe '.resolve' do

      it 'creates one accommodation' do

        #accommodation = create(:accommodation)
        #description1 = create(:description)
        #description2 = create(:description)
        #accommodation.descriptions.append(description1)
        #accommodation.descriptions.append(description2)

        expect do
          post '/graphql', params: { query: query(name: "Casa bella",price: 223.5) },
               headers: {"token": "qg75rhO4CCWwo0aSO1qWHss+kxY=--zgTKUC5y18CAKUSv--i4lvo3Dmu5zw8X00VWjKJw=="}
        end.to change { Accommodation.count }.by(1)
      end

      # it 'returns a book' do
      #   author = create(:author)
      #
      #   post '/graphql', params: { query: query(author_id: author.id) }
      #   json = JSON.parse(response.body)
      #   data = json['data']['createBook']
      #
      #   expect(data).to include(
      #                       'id'              => be_present,
      #                       'title'           => 'Tripwire',
      #                       'publicationDate' => 1999,
      #                       'genre'           => 'Thriller',
      #                       'author'          => { 'id' => author.id.to_s }
      #                   )
      # end
    end

    def query(name:, price:)
      <<~GQL
        mutation {
          createAccommodation(
            accommodation:{
              accommodationData:{
                name: "#{name}"
                price: #{price}
              }
                          descriptions:[{
            text: "Mansion Fernandez"
            language:"es"
          },
          {
            text: "Fernandez residence"
            language: "en"
          }
          ]
            }
          ){
        id
        name
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