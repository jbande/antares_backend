class ProductsController < ApplicationController
  include Rails.application.routes.url_helpers

  def index
    @products = Product.all
  end

  def show

    @product = Product.find_by_id params[:id]
    url = url_for(@product.images[0])
    byebug
  end

  def add_image_form
    @product = Product.find_by_id params[:id]
  end

  def add_image
    product = Product.find_by_id params[:id]
    product.images.attach(params[:product][:images])
    redirect_to show_product_path product
  end

end

