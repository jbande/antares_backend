module Mutations

  class CreateTaxi < BaseMutation

    class TaxiInputData < Types::BaseInputObject
      argument :taxi_data, Types::TaxiTypeInput, required: true
      argument :descriptions, [Types::DescriptionTypeInput], required: true
      argument :transfers, [Types::TransferTypeInput], required: true
    end

    argument :taxi, TaxiInputData, required: false
    type Types::TaxiType

    def resolve(taxi: nil)

      current_user = context[:current_user]

      return unless current_user

      new_taxi = Taxi.new(taxi&.[](:taxi_data).to_h)

      if taxi&.[](:descriptions)
        taxi&.[](:descriptions).each do |item|
          new_taxi.descriptions.append(Description.new(item.to_h))
        end
      end

      if taxi&.[](:transfers)
        taxi&.[](:transfers).each do |item|
          new_taxi.transfers.append(Transfer.new(item.to_h))
        end
      end

      current_user.taxis.append(new_taxi)
      current_user.save
      new_taxi
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