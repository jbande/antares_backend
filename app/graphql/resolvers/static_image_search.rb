require 'search_object'
require 'search_object/plugin/graphql'

class Resolvers::StaticImageSearch < ApplicationController
  # include SearchObject for GraphQL
  include SearchObject.module(:graphql)
  include Rails.application.routes.url_helpers

  # scope is starting point for search
  scope { StaticImage.all }

  type types[Types::StaticImageType]

  # inline input type definition for the advanced filter
  class StaticImageFilter < ::Types::BaseInputObject
    argument :OR, [self], required: false
    argument :uid, String, required: false
  end

  # when "filter" is passed "apply_filter" would be called to narrow the scope
  option :filter, type: StaticImageFilter, with: :apply_filter

  # apply_filter recursively loops through "OR" branches
  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def normalize_filters(value, branches = [])

    scope = StaticImage.where(shop_id: value[:uid])

    #scope = scope.where('name LIKE ?', "%#{value[:name_contains]}%") if value[:name_contains]
    #scope = scope.where('description LIKE ?', "%#{value[:description_contains]}%") if value[:description_contains]
    #scope = scope.where('model LIKE ?', "%#{value[:model_contains]}%") if value[:model_contains]
    #scope = scope.where('brand LIKE ?', "%#{value[:brand_contains]}%") if value[:brand_contains]

    branches << scope

    value[:OR].reduce(branches) { |s, v| normalize_filters(v, s) } if value[:OR].present?

    branches
  end
end