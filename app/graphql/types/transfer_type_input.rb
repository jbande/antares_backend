module Types
  class TransferTypeInput < BaseInputObject
    argument :id, ID, required: false
    argument :from, Integer, required: true
    argument :to, Integer, required: true
    argument :adult_price, Float, required: false
    argument :child_price, Float, required: false
  end
end