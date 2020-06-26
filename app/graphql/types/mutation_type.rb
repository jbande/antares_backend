module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :signin_user, mutation: Mutations::SignInUser

    field :create_product, mutation: Mutations::CreateProduct
    field :update_product, mutation: Mutations::UpdateProduct
    field :delete_product, mutation: Mutations::DeleteProduct
    field :assign_product_to_category, mutation: Mutations::AssignProductToCategory
    field :unassign_product_to_category, mutation: Mutations::UnassignProductToCategory


    field :create_offer, mutation: Mutations::CreateOffer
    field :update_offer, mutation: Mutations::UpdateOffer
    field :delete_offer, mutation: Mutations::DeleteOffer
    field :assign_offer_to_category, mutation: Mutations::AssignOfferToCategory
    field :unassign_offer_to_category, mutation: Mutations::UnassignOfferToCategory

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

    field :create_category, mutation: Mutations::CreateCategory
    field :update_category, mutation: Mutations::UpdateCategory
    field :delete_category, mutation: Mutations::DeleteCategory
    field :assign_parent_category, mutation: Mutations::AssignParentCategory

    field :create_accommodation, mutation: Mutations::CreateAccommodation
    field :update_accommodation, mutation: Mutations::UpdateAccommodation
    field :delete_accommodation, mutation: Mutations::DeleteAccommodation

    field :update_description, mutation: Mutations::UpdateDescription
    field :delete_description, mutation: Mutations::DeleteDescription

  end
end
