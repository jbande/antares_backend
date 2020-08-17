module Mutations

  class CreateTaxi < BaseMutation
    include DescriptionHelper::CRUDS
    include MutationsHelper::Common

    class TaxiInputData < Types::BaseInputObject
      argument :model_data, Types::TaxiTypeInput, required: true
      argument :descriptions, [Types::DescriptionTypeInput], required: true
      argument :transfers, [Types::TransferTypeInput], required: true
    end

    argument :input_data, TaxiInputData, required: false
    type Types::TaxiType

    def resolve(input_data: nil)
      current_user = context[:current_user]
      return unless current_user

      entity= new_entity(Taxi, input_data)
      add_descriptions(entity, input_data)

      if input_data&.[](:transfers)
        input_data&.[](:transfers).each do |item|
          entity.transfers.append(Transfer.new(item.to_h))
        end
      end

      current_user.taxis.append(entity)

      current_user.save

      entity
    end
  end

  class UpdateTaxi < BaseMutation

    argument :taxi, Types::TaxiTypeInput, required: true

    type Types::TaxiType

    def resolve(taxi: nil)
      current_user = context[:current_user]
      return unless current_user

      taxi_to_update = current_user.taxis.find_by id: taxi.id
      return unless taxi_to_update

      taxi_to_update.update_on_changes(taxi.to_h)

      current_user.save

      taxi_to_update
    end

  end

end