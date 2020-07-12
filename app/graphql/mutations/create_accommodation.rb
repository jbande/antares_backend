module Mutations
  class CreateAccommodation < BaseMutation
    include DescriptionHelper::CRUDS
    include MutationsHelper::Common

    class AccommodationInputData < Types::BaseInputObject
      argument :model_data, Types::AccommodationTypeInput, required: true
      argument :descriptions, [Types::DescriptionTypeInput], required: false
    end

    argument :input_data, AccommodationInputData, required: false
    type Types::AccommodationType

    def resolve(input_data: nil)
      current_user = context[:current_user]
      return unless current_user

      entity = new_entity(Accommodation, input_data)
      add_descriptions(entity, input_data)

      current_user.accommodations.append(entity)
      current_user.save
      entity
    end
  end

  class DeleteAccommodation < BaseMutation
    null true

    field :ret, String, null: true
    field :code, String, null: true
    field :msg, String, null: true

    argument :id, Integer, required: true

    def resolve(id: nil)
      current_user = context[:current_user]
      accommodation = current_user.accommodations.find_by_id(id)
      if accommodation
        accommodation.destroy
        result = {ret: 'OK', code: 'SUCCESS', msg:'object deleted'}
      else
        result = {ret: 'ERROR', code: 'OBJECT-NOT-FOUND', msg:'could not find object'}
      end
      result
    end
  end

  class UpdateAccommodation < BaseMutation

    class AccommodationUpdateInputData < Types::BaseInputObject
      argument :id, Int, required: false
      argument :accommodation_data, Types::AccommodationTypeInput, required: false
    end

    argument :accommodation, AccommodationUpdateInputData, required: false

    type Types::AccommodationType

    def resolve(accommodation: nil)

      current_user = context[:current_user]

      updated_accommodation = current_user.accommodations.find_by_id accommodation.id

      updated_accommodation.update_on_changes(accommodation&.[](:accommodation_data).to_h)

      current_user.save

      updated_accommodation

    end
  end

end
