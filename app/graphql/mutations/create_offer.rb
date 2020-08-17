module Mutations
  class CreateOffer < BaseMutation

    argument :title, String, required: true
    argument :description, String, required: false
    argument :product_id, Int, required: true
    argument :start_date, String, required: false
    argument :end_date, String, required: false
    argument :price, Float, required: true

    type Types::OfferType

    def resolve(product_id: nil, title: nil, description: nil, start_date: nil, end_date: nil, price: nil)

      current_user = context[:current_user]

      product = Product.find_by_id(product_id)
      return unless product

      offer = nil

      if current_user and product
        offer = Offer.new(
            description: description,
            title: title,
            start_date: start_date,
            end_date: end_date,
            user_id: current_user.id,
            product_id: product.id,
            price:price
        )
        offer.save
      end
      offer
    end
  end

  class UpdateOffer < BaseMutation
    argument :id, Integer, required: true
    argument :title, String, required: false
    argument :description, String, required: false
    argument :start_date, String, required: false
    argument :end_date, String, required: false
    argument :price, Float, required: true


    type Types::OfferType

    def resolve(id: nil, title: nil, description: nil, start_date: nil, end_date:  nil, price: nil)
      current_user = context[:current_user]
      offer = current_user.offers.find_by_id(id)
      if offer
        offer.update_on_changes(
            title: title,
            description: description,
            start_date: start_date,
            end_date: end_date,
            price: price)
      end
      offer
    end
  end

  class DeleteOffer < BaseMutation
    null true

    field :ret, String, null: true
    field :code, String, null: true
    field :msg, String, null: true

    argument :id, Integer, required: true

    def resolve(id: nil)
      current_user = context[:current_user]
      offer = current_user.offers.find_by_id(id)
      if offer
        offer.destroy
        result = {ret: 'OK', code: 'SUCCESS', msg:'object deleted'}
      else
        result = {ret: 'ERROR', code: 'OBJECT-NOT-FOUND', msg:'could not find object'}
      end
      result
    end
  end

  class AssignOfferToCategory < BaseMutation

    argument :category_id, Integer, required: false
    argument :id, Integer, required: true
    type Types::OfferType

    def resolve(id: nil, category_id: nil)
      current_user = context[:current_user]
      offer = current_user.offers.find_by_id(id)
      if offer
        category = Category.find_by_id category_id
        if category
          category.offers.append(offer)
          category.save
        end
      end
      offer
    end
  end

  class UnassignOfferToCategory < BaseMutation

    argument :category_id, Integer, required: false
    argument :id, Integer, required: true

    type Types::OfferType

    def resolve(id: nil, category_id: nil)
      current_user = context[:current_user]
      offer = current_user.offers.find_by_id(id)
      if offer
        category = Category.find_by_id category_id
        if category
          category.offers.delete(offer)
          category.save
        end
      end
      offer
    end
  end

end