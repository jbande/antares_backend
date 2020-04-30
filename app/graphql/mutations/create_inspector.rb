module Mutations
  class CreateInspector < BaseMutation
    argument :terms, String, required: true
    argument :expiry_date, String, required: false

    type Types::InspectorType

    def resolve(terms: nil, expiry_date: nil)
      Inspector.create!(
          terms: terms,
          expiry_date: expiry_date,
          priority: 5,
          user: context[:current_user]
      )
    end
  end
end
