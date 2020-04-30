module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :signin_user, mutation: Mutations::SignInUser
    field :create_product, mutation: Mutations::CreateProduct
    field :update_product, mutation: Mutations::UpdateProduct
    field :delete_product, mutation: Mutations::DeleteProduct
    field :create_offer, mutation: Mutations::CreateOffer
    field :update_offer, mutation: Mutations::UpdateOffer
    field :delete_offer, mutation: Mutations::DeleteOffer
    field :create_inspector, mutation: Mutations::CreateInspector
  end
end
