module Types
  class AttractionTypeInput < BaseInputObject

    argument :id, ID, required: false
    argument :name, String, required: false
    argument :features, [Integer], required: false
    argument :activities, [Integer], required: false
    argument :hash_tags, [String], required: false
    #field :languages, todo: define this

    argument :status, Integer, required: false
    argument :subdomain_name, String, required: false

    argument :latitude, Float, required: false
    argument :longitude, Float, required: false

  end
end