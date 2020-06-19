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

    field :create_tour, mutation: Mutations::CreateTour
    field :update_tour_includes, mutation: Mutations::UpdateTourIncludes
    field :update_tour_excludes, mutation: Mutations::UpdateTourExcludes
    field :update_tour_plus, mutation: Mutations::UpdateTourPlus
    field :update_tour_suplements, mutation: Mutations::UpdateTourSuplement
    field :update_tour_days, mutation: Mutations::UpdateTourDays

    field :create_static_text, mutation: Mutations::CreateStaticText
    field :update_static_text, mutation: Mutations::UpdateStaticText
    field :delete_static_text, mutation: Mutations::DeleteStaticText
  end
end
