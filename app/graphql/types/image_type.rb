module Types
  class ImageType < Types::BaseObject
    field :id, ID, null: false
    field :original, String, null: false
    field :v100_100, String, null: false
    field :tiny, String, null: false
    field :card_h, String, null: false
    field :card_v, String, null: false

    field :visor, String, null: false
    field :visor_prev, String, null: false
    field :room_card, String, null: false
    field :m_card, String, null: false

  end
end
