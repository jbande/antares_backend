require 'search_object'
require 'search_object/plugin/graphql'

class Resolvers::AccommodationSearch < ApplicationController
  # include SearchObject for GraphQL
  include SearchObject.module(:graphql)
  include Rails.application.routes.url_helpers

  # scope is starting point for search
  scope { Accommodation.all }

  type types[Types::AccommodationType]

  # inline input type definition for the advanced filter
  class AccommodationFilter < ::Types::BaseInputObject
    argument :OR, [self], required: false
    argument :id, Int, required: false
    argument :page, Int, required: false
    argument :page_size, Int, required: false
  end

  # when "filter" is passed "apply_filter" would be called to narrow the scope
  option :filter, type: AccommodationFilter, with: :apply_filter

  # apply_filter recursively loops through "OR" branches
  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def normalize_filters(value, branches = [])

    if value[:page_size] and value[:page_size] > 20
      limit = 20
    else
      limit = value[:page_size]
    end

    if value[:page]
      offset = value[:page] * limit
    else
      offset = 0
    end

    if value[:id]
      scope = Accommodation.includes(:rooms).includes(:amenities).includes(:accom_extras).all.references(:rooms).where(id: value[:id])
    else
      scope = Accommodation.includes(:rooms).all.references(:rooms)
      scope = scope.limit(limit).offset(offset)
    end



    #scope = scope.where('name LIKE ?', "%#{value[:name_contains]}%") if value[:name_contains]
    #scope = scope.where('description LIKE ?', "%#{value[:description_contains]}%") if value[:description_contains]
    #scope = scope.where('model LIKE ?', "%#{value[:model_contains]}%") if value[:model_contains]
    #scope = scope.where('brand LIKE ?', "%#{value[:brand_contains]}%") if value[:brand_contains]

    branches << scope

    value[:OR].reduce(branches) { |s, v| normalize_filters(v, s) } if value[:OR].present?

    branches
  end
end