require 'search_object'
require 'search_object/plugin/graphql'

class Resolvers::OfferSearch

  # include SearchObject for GraphQL
  include SearchObject.module(:graphql)

  # scope is starting point for search
  scope { Offer.all }

  type types[Types::OfferType]

  # inline input type definition for the advanced filter
  class OfferFilter < ::Types::BaseInputObject
    argument :OR, [self], required: false
    argument :title_contains, String, required: false
    argument :description_contains, String, required: false
    argument :start_date_after, String, required: false
    argument :end_date_before, String, required: false

    argument :product_name_contains, String, required: false
    argument :product_description_contains, String, required: false
    argument :product_brand_contains, String, required: false
    argument :product_model_contains, String, required: false
    argument :product_maker_contains, String, required: false
    argument :categories, [Int], required: false
    argument :top_price, Int, required: false
    argument :bottom_price, Int, required: false
  end

  # when "filter" is passed "apply_filter" would be called to narrow the scope
  option :filter, type: OfferFilter, with: :apply_filter

  # apply_filter recursively loops through "OR" branches
  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def normalize_filters(value, branches = [])
    if value[:categories]
      scope = Offer.includes(:categories).where('categories.id in (?)', value[:categories]).references(:categories)
    else
      scope = Offer.all
    end

    scope = scope.where('price < ?', value[:top_price]) if value[:top_price]
    scope = scope.where('price > ?', value[:top_price]) if value[:bottom_price]

    scope = scope.where('title LIKE ?', "%#{value[:title_contains]}%") if value[:title_contains]
    scope = scope.where('description LIKE ?', "%#{value[:description_contains]}%") if value[:description_contains]

    scope = scope.includes(:product).where('products.name LIKE ?', "%#{value[:product_name_contains]}%").references(:product) if value[:product_name_contains]
    scope = scope.includes(:product).where('products.description LIKE ?', "%#{value[:product_description_contains]}%").references(:product) if value[:product_description_contains]
    scope = scope.includes(:product).where('products.brand LIKE ?', "%#{value[:product_brand_contains]}%").references(:product) if value[:product_brand_contains]
    scope = scope.includes(:product).where('products.model LIKE ?', "%#{value[:product_model_contains]}%").references(:product) if value[:product_model_contains]
    scope = scope.includes(:product).where('products.maker LIKE ?', "%#{value[:product_maker_contains]}%").references(:product) if value[:product_maker_contains]

    scope = scope.where('start_date > ?', "%#{value[:start_date_after]}%") if value[:start_date_after]
    scope = scope.where('end_date_before < ?', "%#{value[:end_date_before]}%") if value[:end_date_before]

    branches << scope

    value[:OR].reduce(branches) { |s, v| normalize_filters(v, s) } if value[:OR].present?

    branches
  end
end