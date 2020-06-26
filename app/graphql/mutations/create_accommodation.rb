module Mutations
  class CreateAccommodation < BaseMutation

    class AccommodationInputData < Types::BaseInputObject
      argument :descriptions, [Types::DescriptionTypeInput], required: false
      argument :accommodation_data, Types::AccommodationTypeInput, required: true
    end

    argument :accommodation, AccommodationInputData, required: false

    type Types::AccommodationType

    def resolve(accommodation: nil)
      current_user = context[:current_user]

      new_accommodation = Accommodation.new(accommodation&.[](:accommodation_data).to_h)

      if accommodation&.[](:descriptions)
        accommodation&.[](:descriptions).each do |item|
          new_accommodation.descriptions.append(Description.new(item.to_h))
        end
      end

      current_user.accommodations.append(new_accommodation)
      current_user.save
      new_accommodation

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
