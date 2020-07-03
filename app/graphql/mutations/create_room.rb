module Mutations
  class CreateRoom < BaseMutation

    class RoomInputData < Types::BaseInputObject
      argument :accommodation_id, Int, required: true
      argument :descriptions, [Types::DescriptionTypeInput], required: false
      argument :room_data, Types::RoomTypeInput, required: true
    end

    argument :room, RoomInputData, required: false

    type Types::RoomType

    def resolve(room: nil)
      current_user = context[:current_user]

      return unless current_user

      accommodation = current_user.accommodations.find_by id: room.accommodation_id

      return unless accommodation

      new_room = accommodation.rooms.new(room&.[](:room_data).to_h)

      if room&.[](:descriptions)
        room&.[](:descriptions).each do |item|
          new_room.descriptions.append(Description.new(item.to_h))
        end
      end

      accommodation.rooms.append(new_room)
      accommodation.save
      new_room

    end
  end

  class DeleteRoom < BaseMutation
    null true

    field :ret, String, null: true
    field :code, String, null: true
    field :msg, String, null: true

    argument :id, Integer, required: true

    def resolve(id: nil)
      current_user = context[:current_user]

      return {ret: 'ERROR', code: 'USER-NOT-FOUND', msg:'could not find user'} unless current_user

      accommodation = current_user.accommodations.find_by_id(id)

      return {ret: 'ERROR', code: 'ACCOMODATION-NOT-FOUND', msg:'could not find accommodation'} unless accommodation

      room = accommodation.room.find_by id: id

      if room
        room.destroy
        result = {ret: 'OK', code: 'SUCCESS', msg:'object deleted'}
      else
        result = {ret: 'ERROR', code: 'OBJECT-NOT-FOUND', msg:'could not find object'}
      end
      result
    end
  end

  class UpdateRoom < BaseMutation

    class RoomUpdateInputData < Types::BaseInputObject
      argument :id, Int, required: true
      argument :room_data, Types::RoomTypeInput, required: true
    end

    argument :room, RoomUpdateInputData, required: false

    type Types::RoomType

    def resolve(room: nil)

      current_user = context[:current_user]

      room = Room.find_by id: room.id

      if room.accommodation.user == current_user
        room.update_on_changes(room&.[](:room_data).to_h)
      end

      current_user.save

      room

    end
  end

end
