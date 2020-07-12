
class ImagesController < ApplicationController

  include UsersHelper::Access

  def initialize
    @models_dictionary = {
        tour: Tour,
        accommodation: Accommodation,
        room: Room,
        attraction: Attraction,
        taxi: Taxi
    }
    super
  end

  def new
  end


  def create

    #current_user = get_current_user
    #return unless current_user

    model = nil
    if @models_dictionary.has_key? params[:entity_type].to_sym
      model = @models_dictionary[params[:entity_type].to_sym]
    end

    return unless model

    model_instance = model.find_by_id params[:entity_id]

    if model_instance #and model_instance.user == current_user
      model_instance.images.attach(params[:images])
    end

    render status: 200, json: {status:'ok'}

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