module Types
  class DescriptionTypeInput < BaseInputObject
    argument :text, String, required: true
    argument :language, String, required: true
  end
end