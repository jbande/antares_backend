
class ImagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  include UsersHelper::Access

  def initialize
    @models_dictionary = {
        tour: Tour,
        accommodation: Accommodation,
        room: Room,
        attraction: Attraction,
        taxi: Taxi,
        user: User,
        tour_day: TourDay
    }
    super
  end

  def new
  end


  def create

    current_user = get_current_user
    return unless current_user

    model = nil
    if @models_dictionary.has_key? params[:entity_type].to_sym
      model = @models_dictionary[params[:entity_type].to_sym]
    end

    return unless model
    model_instance = model.find_by_id params[:entity_id]

    if model_instance  #and model_instance.user == current_user
      if model_instance.instance_of? User
        model_instance.avatar.attach(params[:image])
      elsif model_instance.instance_of? TourDay
        model_instance.portrait.attach(params[:image])
      else
        model_instance.images.attach(params[:image])
      end
    end

    render status: 200, json: {code:100}

  end


  def add_avatar
    current_user = get_current_user
    return unless current_user
    current_user.avatar.attach(params[:avatar])

    if current_user.save
      res = {visor: current_user.avatar_urls.visor, code: 100}
    else
      res = {code:201}
    end
    render status: 200, json: res
  end

  def add_tour_day_image
    current_user = get_current_user
    return unless current_user

    tour = current_user.tours.find_by_id params[:tour_id]
    return unless tour

    day = tour.tour_days.find_by_day_number params[:day_number]
    return unless day

    if day.portrait.attach(params[:image])
      res = {code: 100}
    else
      res = {code:201}
    end
    render status: 200, json: res

  end

  def remove_image

    #current_user = get_current_user
    #return unless current_user

    model = nil
    if @models_dictionary.has_key? params[:entity_type].to_sym
      model = dict[params[:entity_type].to_sym]
    end

    return unless model

    model_instance = model.find_by_id params[:entity_id]

    if model_instance #and model_instance.user == current_user
      image = model_instance.images.find_by_id params[:image_id]
      image.destroy
      model_instance.save
    end

    render status: 200, json: {status:'ok'}
  end

end