module Mutations

  class UpdateDescription < BaseMutation
    include DescriptionHelper::CRUDS

    argument :input_data, Types::DescriptionAssignInputData, required: false

    type Types::DescriptionType

    def resolve(input_data: nil)

      current_user = context[:current_user]
      dict = {
          tour: Tour,
          accommodation: Accommodation,
          room: Room
      }
      model_class = dict[input_data.describable_type.to_sym]

      return unless model_class

      describable = model_class.find_by id:input_data.describable_id

      description = nil
      if input_data.description and describable and describable.user == current_user
        description = update_description(describable, input_data.description_id, input_data.description.to_h)
      end
      current_user.save
      description
    end
  end

  class DeleteDescription < BaseMutation
    include DescriptionHelper::CRUDS

    argument :input_data, Types::DescriptionAssignInputData, required: false

    field :ret, String, null: true
    field :code, String, null: true
    field :msg, String, null: true

    def resolve(input_data: nil)

      current_user = context[:current_user]

      dict = {
          tour: Tour,
          accommodation: Accommodation,
          room: Room
      }
      model_class = dict[input_data.describable_type.to_sym]

      describable = model_class.find_by id: input_data.describable_id

      description = nil
      if describable and describable.user == current_user
        description = destroy_description(describable, input_data.description_id)
      end


      if description
        result = {ret: 'OK', code: 'SUCCESS', msg:'object deleted'}
      else
        result = {ret: 'ERROR', code: 'OBJECT-NOT-FOUND', msg:'could not find object'}
      end
      result
    end
  end

end
