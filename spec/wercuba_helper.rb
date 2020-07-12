# require 'factories/region_factory'
module WercubaHelper
  module COMMON
    def create_and_sign_in_user
      post '/graphql', params: { query: mutation_create_user(first_name: "Juan",
                                                             last_name:"Perez",
                                                             email: "juan@gmail.com",
                                                             password: "111111" )}

      result = JSON.parse(response.body)

      @user = result['data']
      #byebug
      post '/graphql', params: { query: mutation_sign_in_user(email: "juan@gmail.com", password:"111111") }

      result = JSON.parse(response.body)

      @user_token = result['data']['signinUser']['token']
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

    def create_regions
      @region1 = create(:region, country_code: "CU", name: "Pinar del Rio")
      @region2 = create(:region, country_code: "CU", name: "Habana")
      @region3 = create(:region, country_code: "CU", name: "Santiago de Cuba")
      @region4 = create(:region, country_code: "CU", name: "Villa clara")
    end

    def create_one_accommodation
      @accommodation1 = create(:accommodation,
                       user_id: @user['createUser']['id'].to_i,
                       name: 'Casa Bella',
                       price: '45',
                       descriptions: [
                           build(:description, language: 'es', text: 'Hermosisimo Lugar'),
                           build(:description, language: 'en', text: 'Beautifull Place')
                       ])
    end

  end

end