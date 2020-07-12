module DescriptionHelper
  module CRUDS
    def update_description(describable, description_id, data)
      description = nil
      if describable
        description = describable.descriptions.find_by_id description_id
        if description
          description.update_on_changes(data)
        end
      end
      description
    end

    def destroy_description(describable, description_id)
      destroyed = false
      if describable
        description = describable.descriptions.find_by_id description_id
        if description
          description.destroy
          destroyed = true
        end
      end
      destroyed
    end

    def add_descriptions(entity, input_data)
      if input_data&.[](:descriptions)
        input_data&.[](:descriptions).each do |item|
          entity.descriptions.append(Description.new(item.to_h))
        end
      end
    end
  end
end