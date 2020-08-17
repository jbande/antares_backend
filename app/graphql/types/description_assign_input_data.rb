module Types
  class DescriptionAssignInputData < Types::BaseInputObject
    argument :describable_id, Int, required: true
    argument :description_id, Int, required: true
    argument :describable_type, String, required: true
    argument :description, Types::DescriptionTypeInput, required: false
  end
end