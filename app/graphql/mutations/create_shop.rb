module Mutations
  class CreateShop < BaseMutation

    argument :name, String, required: true
    argument :uid, String, required: true

    type Types::ShopType

    def resolve(name: nil, uid:nil)
      shop = Shop.create!(name:name, uid:uid)
      shop
    end
  end

end
