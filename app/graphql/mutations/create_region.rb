module Mutations
  class CreateRegion < BaseMutation

    argument :region, Types::RegionTypeInput, required: true

    type Types::RegionType

    def resolve(region: nil)
      current_user = context[:current_user]

      return unless current_user

      return if region.id
      Region.create(region.to_h)
    end
  end

  class DeleteRegion < BaseMutation
    null true

    field :ret, String, null: true
    field :code, String, null: true
    field :msg, String, null: true

    argument :id, Integer, required: true

    def resolve(id: nil)
      current_user = context[:current_user]

      return {ret: 'ERROR', code: 'USER-NOT-FOUND', msg:'could not find user'} unless current_user

      region = Region.find_by id: id

      if region
        region.destroy
        result = {ret: 'OK', code: 'SUCCESS', msg:'object deleted'}
      else
        result = {ret: 'ERROR', code: 'OBJECT-NOT-FOUND', msg:'could not find object'}
      end
      result
    end
  end

  class UpdateRegion < BaseMutation

    argument :region, Types::RegionTypeInput, required: true

    type Types::RegionType

    def resolve(region: nil)

      current_user = context[:current_user]

      return unless current_user

      return unless region.id

      new_region = Region.find_by id: region.id

      new_region.update_on_changes(region.to_h)

      new_region

    end
  end

end
