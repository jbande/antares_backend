
FactoryBot.define do
  factory :accommodation do
    sequence(:name) {|n| "Casa (#{n})"}
    price {45}
    descriptions {description}
  end
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