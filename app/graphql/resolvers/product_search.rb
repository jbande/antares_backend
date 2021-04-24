require 'search_object'
require 'search_object/plugin/graphql'

class Resolvers::ProductSearch < ApplicationController
  # include SearchObject for GraphQL
  include SearchObject.module(:graphql)
  include Rails.application.routes.url_helpers

  # scope is starting point for search
  scope { Product.all }

  type types[Types::ProductType]

  # inline input type definition for the advanced filter
  class ProductFilter < ::Types::BaseInputObject
    argument :OR, [self], required: false
    argument :id, Int, required: false
    argument :name_contains, String, required: false
    argument :description_contains, String, required: false
    argument :model_contains, String, required: false
    argument :brand_contains, String, required: false
    argument :categories, [Int], required: false
    argument :shop_uid, String, required: true
  end

  # when "filter" is passed "apply_filter" would be called to narrow the scope
  option :filter, type: ProductFilter, with: :apply_filter

  # apply_filter recursively loops through "OR" branches
  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def normalize_filters(value, branches = [])

    shop = Shop.find_by_uid value[:shop_uid]

    if value[:categories]
      scope = Product.includes(:categories).where(shop_id: shop.id).where('categories.id in (?)', value[:categories]).references(:categories)
    else
      scope = Product.all
    end

    scope = scope.where('id = ?', "#{value[:id]}") if value[:id]
    scope = scope.where('name LIKE ?', "%#{value[:name_contains]}%") if value[:name_contains]
    scope = scope.where('description LIKE ?', "%#{value[:description_contains]}%") if value[:description_contains]
    scope = scope.where('model LIKE ?', "%#{value[:model_contains]}%") if value[:model_contains]
    scope = scope.where('brand LIKE ?', "%#{value[:brand_contains]}%") if value[:brand_contains]

    branches << scope

    value[:OR].reduce(branches) { |s, v| normalize_filters(v, s) } if value[:OR].present?

    branches
  end
end