module Mutations
  class CreateTour < BaseMutation
    include DescriptionHelper::CRUDS
    include MutationsHelper::Common

    class TourInputData < Types::BaseInputObject
      argument :model_data, Types::TourTypeInput, required: false

      argument :tour_includes, [Types::TourIncludesTypeInput], required: false
      argument :tour_excludes, [Types::TourExcludesTypeInput], required: false
      argument :tour_suplements, [Types::TourSuplementTypeInput], required: false
      argument :descriptions, [Types::DescriptionTypeInput], required: true
      argument :tour_days, [Types::TourDayTypeInput], required: false
      argument :tour_plus, [Types::TourPlusTypeInput], required: false
    end

    argument :input_data, TourInputData, required: false
    argument :on_behalf_of_user, Int, required:false
    type Types::TourType

    def resolve(input_data: nil, on_behalf_of_user: nil)

      if on_behalf_of_user
        current_user = User.find_by_id on_behalf_of_user
      else
        current_user = context[:current_user]
      end

      entity= new_entity(Tour, input_data)
      add_descriptions(entity, input_data)
      entity.save

      insert_includes(input_data:input_data, entity:entity)
      insert_excludes(input_data:input_data, entity:entity)
      insert_suplemments(input_data:input_data, entity:entity)
      insert_tour_days(input_data:input_data, entity:entity)
      insert_tour_plus(input_data:input_data, entity:entity)

      current_user.tours.append(entity)
      current_user.save
      entity
    end

  end

  class UpdateTourIncludes < BaseMutation
    class TourUpdateIncludesData < Types::BaseInputObject
      argument :data_list, [Types::TourIncludesTypeInput], required: true
      argument :id, Integer, required: true
    end

    argument :tour, TourUpdateIncludesData, required: false
    type Types::TourType

    def resolve(tour: nil)
      current_user = context[:current_user]
      upd_tour = current_user.tours.find_by_id tour.id
      upd_tour.tour_includes.destroy_all

      tour&.[](:data_list).each do |item|
        upd_tour.tour_includes.create(item.to_h)
      end
      upd_tour.save
      upd_tour
    end
  end

  class UpdateTourExcludes < BaseMutation
    class TourUpdateExcludesData < Types::BaseInputObject
      argument :data_list, [Types::TourExcludesTypeInput], required: true
      argument :id, Integer, required: true
    end

    argument :tour, TourUpdateExcludesData, required: false
    type Types::TourType

    def resolve(tour: nil)
      current_user = context[:current_user]
      upd_tour = current_user.tours.find_by_id tour.id
      upd_tour.tour_excludes.destroy_all

      tour&.[](:data_list).each do |item|
        upd_tour.tour_excludes.create(item.to_h)
      end
      upd_tour.save
      upd_tour
    end
  end

  class UpdateTourSuplement < BaseMutation
    class TourUpdateSuplementData < Types::BaseInputObject
      argument :data_list, [Types::TourSuplementTypeInput], required: true
      argument :id, Integer, required: true
    end

    argument :tour, TourUpdateSuplementData, required: false
    type Types::TourType

    def resolve(tour: nil)
      current_user = context[:current_user]
      upd_tour = current_user.tours.find_by_id tour.id
      upd_tour.tour_suplements.destroy_all

      tour&.[](:data_list).each do |item|
        upd_tour.tour_suplements.create(item.to_h)
      end
      upd_tour.save
      upd_tour
    end
  end

  class UpdateTourDays < BaseMutation
    class TourUpdateDaysData < Types::BaseInputObject
      argument :tour_days, [Types::TourDayTypeInput], required: true
      argument :id, Integer, required: true
    end

    argument :tour, TourUpdateDaysData, required: false
    type Types::TourType

    def resolve(tour: nil)
      current_user = context[:current_user]
      upd_tour = current_user.tours.find_by_id tour.id
      upd_tour.tour_days.destroy_all

      insert_tour_days(input_data:input_data, entity:upd_tour)

      upd_tour.save
      upd_tour
    end
  end

  class UpdateTourPlus < BaseMutation
    class TourUpdatePlusData < Types::BaseInputObject
      argument :data_list, [Types::TourPlusTypeInput], required: true
      argument :id, Integer, required: true
    end

    argument :tour, TourUpdatePlusData, required: false
    type Types::TourType

    def resolve(tour: nil)
      current_user = context[:current_user]
      upd_tour = current_user.tours.find_by_id tour.id
      upd_tour.tour_plus.destroy_all

      tour&.[](:data_list).each do |item|
        upd_tour.tour_plus.create(item.to_h)
      end
      upd_tour.save
      upd_tour
    end
  end


end