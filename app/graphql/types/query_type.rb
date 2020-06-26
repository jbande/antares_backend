module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :all_users, [UserType], null: false
    #field :all_products, [ProductType], null: false
    field :all_products, [ProductType], resolver: Resolvers::ProductSearch
    field :all_offers, [OfferType], resolver: Resolvers::OfferSearch
    field :my_inspectors, [InspectorType], resolver: Resolvers::InspectorSearch
    field :my_notifications, [NotificationType], resolver: Resolvers::NotificationSearch

    field :all_tours, [TourType], null: false
    field :all_static_texts, [StaticTextType], null: false

    field :all_static_images, [StaticImageType], null: false
    field :all_categories, [CategoryType], null: false

    field :all_accommodations, [AccommodationType], null: false

    def all_users
      User.all
    end

    def all_tours
      Tour.all
    end

    def all_static_texts
      StaticText.all
    end

    def all_static_images
      StaticImage.all
    end

    def all_categories
      Category.all
    end

    def all_accommodations
      Accommodation.all
    end

    #def all_offers
    #  Offer.all
    #end

    #def all_products
    #  Product.all
    #end
  end
end
