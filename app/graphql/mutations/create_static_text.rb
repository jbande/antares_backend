module Mutations
  class CreateStaticText < BaseMutation

    argument :language, String, required: true
    argument :text, String, required: false
    argument :page_position, String, required: true

    type Types::StaticTextType

    def resolve(language: nil, text: nil, page_position: nil)
      static_text = StaticText.new(
          text: text,
          language: language,
          page_position: page_position,
      )
      static_text.save
      static_text
    end
  end

  class UpdateStaticText < BaseMutation
    argument :id, Integer, required: true
    argument :language, String, required: true
    argument :text, String, required: false
    argument :page_position, String, required: true


    type Types::StaticTextType

    def resolve(id: nil, language: nil, text: nil, page_position: nil)
      static_text = StaticText.find_by_id(id)
      if static_text
        static_text.update_on_changes(
            text: text,
            language: language,
            page_position: page_position,)
      end
      static_text
    end
  end

  class DeleteStaticText < BaseMutation
    null true

    field :ret, String, null: true
    field :code, String, null: true
    field :msg, String, null: true

    argument :id, Integer, required: true

    def resolve(id: nil)
      static_text = StaticText.find_by_id(id)
      if static_text
        static_text.destroy
        result = {ret: 'OK', code: 'SUCCESS', msg:'object deleted'}
      else
        result = {ret: 'ERROR', code: 'OBJECT-NOT-FOUND', msg:'could not find object'}
      end
      result
    end
  end

end