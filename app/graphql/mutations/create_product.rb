module Mutations
  class CreateProduct < BaseMutation
    argument :name, String, required: true
    argument :description, String, required: true
    argument :maker, String, required: false
    argument :brand, String, required: false
    argument :model, String, required: false
    argument :stock, Integer, required: false
    argument :expiry_date, String, required: false
    argument :produced_date, String, required: false
    argument :shop_uid, String, required: true

    type Types::ProductType

    def resolve(name: nil, description: nil, maker: nil, brand: nil, model: nil,
                stock: nil, expiry_date: nil, produced_date: nil, shop_uid: nil)

      current_user = context[:current_user]
      return unless current_user

      shop = current_user.shops.find_by_uid shop_uid
      return unless shop

      Product.create!(
          name: name,
          description: description,
          maker: maker,
          brand: brand,
          model: model,
          stock: stock,
          expiry_date: expiry_date,
          produced_date: produced_date,
          user: context[:current_user],
          shop: shop
      )
    end
  end

  class UpdateProduct < BaseMutation
    argument :name, String, required: false
    argument :description, String, required: false
    argument :maker, String, required: false
    argument :brand, String, required: false
    argument :model, String, required: false
    argument :stock, Integer, required: false
    argument :expiry_date, String, required: false
    argument :produced_date, String, required: false
    argument :id, Integer, required: true

    type Types::ProductType

    def resolve(id: nil, name: nil, description: nil, maker: nil, brand: nil, model: nil, stock: nil, expiry_date: nil, produced_date: nil)
      current_user = context[:current_user]
      product = current_user.static_image.find_by_id(id)
      if product
        product.update_on_changes(
            name: name,
            description: description,
            maker: maker,
            brand: brand,
            model: model,
            stock: stock,
            expiry_date: expiry_date,
            produced_date: produced_date)
      end
      product
    end
  end

  class DeleteProduct < BaseMutation
    null true

    field :ret, String, null: true
    field :code, String, null: true
    field :msg, String, null: true

    argument :id, Integer, required: true

    def resolve(id: nil)
      current_user = context[:current_user]
      product = current_user.products.find_by_id(id)
      if product
        product.destroy
        result = {ret: 'OK', code: 'SUCCESS', msg:'object deleted'}
      else
        result = {ret: 'ERROR', code: 'OBJECT-NOT-FOUND', msg:'could not find object'}
      end
      result
    end
  end

  class AssignProductToCategory < BaseMutation

    argument :category_id, Integer, required: false
    argument :id, Integer, required: true
    type Types::ProductType

    def resolve(id: nil, category_id: nil)
      current_user = context[:current_user]
      product = current_user.products.find_by_id(id)
      if product
        category = Category.find_by_id category_id
        if category
          category.products.append(product)
          category.save
        end
      end
      product
    end
  end

  class UnassignProductToCategory < BaseMutation

    argument :category_id, Integer, required: false
    argument :id, Integer, required: true

    type Types::ProductType

    def resolve(id: nil, category_id: nil)
      current_user = context[:current_user]
      product = current_user.products.find_by_id(id)
      if product
        category = Category.find_by_id category_id
        if category
          category.products.delete(product)
          category.save
        end
      end
      product
    end
  end

end
