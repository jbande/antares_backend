module Mutations

  class CreateCategory < BaseMutation

    argument :name, String, required: true
    argument :page_position, String, required: false
    argument :parent_category_id, Int, required: false

    type Types::CategoryType

    def resolve(name: nil, page_position: nil, parent_category_id: nil)

      current_user = context[:current_user]
      return unless current_user

      shop = current_user.shops.find_by_uid "default-uid"
      return unless shop

      category = Category.new(
            name: name,
            parent_category_id: parent_category_id,
            page_position: page_position,
            shop: shop
      )
      category.save
      category
    end
  end

  class UpdateCategory < BaseMutation
    argument :id, Integer, required: true
    argument :name, String, required: true
    argument :page_position, String, required: false

    type Types::CategoryType

    def resolve(id: nil, name: nil, page_position: nil)
      category = Category.find_by_id id
      category.update_on_changes(
          name: name,
          page_position: page_position)
      category
    end
  end

  class AssignParentCategory < BaseMutation
    argument :id, Integer, required: true
    argument :parent_category_id, Integer, required: false

    type Types::CategoryType

    def resolve(id: nil, parent_category_id: nil)
      category = nil
      if parent_category_id
        parent_category = Category.find_by_id parent_category_id
        if parent_category
          category = Category.find_by_id id
          category.update(
              parent_category_id:parent_category.id
          )
        end
      else
        category = Category.find_by_id id
        category.update(
            parent_category_id:parent_category_id
        )
      end
      category
    end
  end

  class DeleteCategory < BaseMutation
    null true

    field :ret, String, null: true
    field :code, String, null: true
    field :msg, String, null: true

    argument :id, Integer, required: true

    def resolve(id: nil)
      category = Category.find_by_id(id)

      subordinates = Category.find_by_parent_category_id category.id
      if not subordinates

        if category
          category.destroy
          result = {ret: 'OK', code: 'SUCCESS', msg:'object deleted'}
        else
          result = {ret: 'ERROR', code: 'OBJECT-NOT-FOUND', msg:'could not find object'}
        end

      else
        result = {ret: 'ERROR', code: 'SUBORDINATES-FOUND', msg:'This category has subcategories. Please delete subcategories first.'}
      end

      result
    end
  end

end