module MutationsHelper

  module Common
    def new_entity(element_class, input_data)
      element_class.new(input_data&.[](:model_data).to_h)
    end

    def insert_includes(input_data:, entity:)
      if input_data&.[](:tour_includes)
        input_data&.[](:tour_includes).each do |item|
          entity.tour_includes.append(TourInclude.new(item.to_h))
        end
      end
    end

    def insert_excludes(input_data:, entity:)
      if input_data&.[](:tour_excludes)
        input_data&.[](:tour_excludes).each do |item|
          entity.tour_excludes.append(TourExclude.new(item.to_h))
        end
      end
    end

    def insert_suplemments(input_data:, entity:)
      if input_data&.[](:tour_suplements)
        input_data&.[](:tour_suplements).each do |item|
          entity.tour_suplements.append(TourSuplement.new(item.to_h))
        end
      end
    end

    def insert_tour_days(input_data:, entity:)
      if input_data&.[](:tour_days)
        input_data&.[](:tour_days).each do |item|

          input_hash = item.to_h
          new_day = TourDay.new(tittle:input_hash[:tittle],
                                day_number:input_hash[:day_number])

          input_hash[:descriptions].each do |desc|
            new_day.descriptions.append(Description.new(desc))
          end

          entity.tour_days.append(new_day)

        end
      end
    end

    def insert_tour_plus(input_data:, entity:)
      if input_data&.[](:tour_plus)
        input_data&.[](:tour_plus).each do |item|
          entity.tour_plus.append(TourPlu.new(item.to_h))
        end
      end
    end

  end
end