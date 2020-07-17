module Mutations

  class CreateAttraction < BaseMutation
    include DescriptionHelper::CRUDS
    include MutationsHelper::Common

    class AttractionInputData < Types::BaseInputObject
      argument :model_data, Types::AttractionTypeInput, required: true
      argument :descriptions, [Types::DescriptionTypeInput], required: true
      argument :region_id, Int, required: true
    end

    argument :input_data, AttractionInputData, required: false
    type Types::AttractionType

    def resolve(input_data: nil)
      current_user = context[:current_user]
      return unless current_user
      entity = new_entity(Attraction, input_data)
      add_descriptions(entity, input_data)

      re = Region.find_by id: input_data.region_id
      return unless re
      entity.region = re

      current_user.attractions.append(entity)
      current_user.save
      entity
    end

  end

  class UpdateAttraction < BaseMutation

    argument :attraction, Types::AttractionTypeInput, required: true

    type Types::AttractionType

    def resolve(attraction: nil)
      current_user = context[:current_user]
      return unless current_user

      update_element = current_user.attractions.find_by id: attraction.id
      return unless update_element

      update_element.update_on_changes(attraction.to_h)

      current_user.save

      update_element
    end

  end

end