module Mutations
  class CreateTour < BaseMutation

    class TourInputData < Types::BaseInputObject
      argument :tour_includes, [Types::TourIncludesTypeInput], required: false
      argument :tour_excludes, [Types::TourExcludesTypeInput], required: false
      argument :tour_suplements, [Types::TourSuplementTypeInput], required: false
      argument :tour_days, [Types::TourDayTypeInput], required: false
      argument :tour_plus, [Types::TourPlusTypeInput], required: false
      argument :tour_data, Types::TourTypeInput, required: false
    end

    argument :tour, TourInputData, required: false

    type Types::TourType

    def resolve(tour: nil)

      current_user = context[:current_user]

      new_tour = Tour.new(tour&.[](:tour_data).to_h)

      if tour&.[](:tour_includes)
        tour&.[](:tour_includes).each do |item|
          new_tour.tour_includes.append(TourInclude.new(item.to_h))
        end
      end

      if tour&.[](:tour_excludes)
        tour&.[](:tour_excludes).each do |item|
          new_tour.tour_excludes.append(TourExclude.new(item.to_h))
        end
      end

      if tour&.[](:tour_suplements)
        tour&.[](:tour_suplements).each do |item|
          new_tour.tour_suplements.append(TourSuplement.new(item.to_h))
        end
      end

      if tour&.[](:tour_days)
        tour&.[](:tour_days).each do |item|
          new_tour.tour_days.append(TourDay.new(item.to_h))
        end
      end

      if tour&.[](:tour_plus)
        tour&.[](:tour_plus).each do |item|
          new_tour.tour_plus.append(TourPlu.new(item.to_h))
        end
      end

      current_user.tours.append(new_tour)
      current_user.save
      new_tour
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
      argument :data_list, [Types::TourDayTypeInput], required: true
      argument :id, Integer, required: true
    end

    argument :tour, TourUpdateDaysData, required: false
    type Types::TourType

    def resolve(tour: nil)
      current_user = context[:current_user]
      upd_tour = current_user.tours.find_by_id tour.id
      upd_tour.tour_days.destroy_all

      tour&.[](:data_list).each do |item|
        upd_tour.tour_days.create(item.to_h)
      end
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