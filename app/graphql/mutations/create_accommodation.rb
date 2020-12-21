module Mutations
  class CreateAccommodation < BaseMutation
    include DescriptionHelper::CRUDS
    include MutationsHelper::Common

    class AccommodationInputData < Types::BaseInputObject
      argument :model_data, Types::AccommodationTypeInput, required: true
      argument :descriptions, [Types::DescriptionTypeInput], required: false
      argument :region_id, Int, required: true
      argument :amenities, [Int], required: false
      argument :includedServices, [Int], required: false
      argument :excludedServices, [Int], required: false
      argument :rooms, [Types::RoomTypeInput], required: false
    end

    argument :input_data, AccommodationInputData, required: false
    type Types::AccommodationType

    def resolve(input_data: nil)
      current_user = context[:current_user]
      return unless current_user

      entity = new_entity(Accommodation, input_data)
      add_descriptions(entity, input_data)

      re = Region.find_by id: input_data.region_id
      return unless re
      entity.region = re

      if input_data&.[](:amenities)
        input_data&.[](:amenities).each do |item|
          am = Amenity.find_by id: item
          if am
            entity.amenities.append(am)
          end
        end
      end

      #entity.save

      input_data&.[](:rooms).each do |room_item|
        new_room = Room.new(
            price: room_item[:price],
            room_number: room_item[:room_number],
            high_season_price: room_item[:high_season_price],
            low_season_price: room_item[:low_season_price],
            double_beds: room_item[:double_beds],
            single_beds: room_item[:single_beds],
            bunked_beds: room_item[:bunked_beds],
            baby_beds: room_item[:baby_beds]
        )
        add_descriptions(new_room, room_item)

        room_item[:room_amenities].each do |am_id|
          amenity = RoomAmenity.find_by_id am_id
          if amenity
            new_room.room_amenities.append(amenity)
          end
        end

        entity.rooms.append(new_room)

      end

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
