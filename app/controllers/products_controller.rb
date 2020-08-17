class ProductsController < ApplicationController
  include Rails.application.routes.url_helpers

  def index
    @static_image = Product.all
  end

  def show
    @product = Product.find_by_id params[:id]
    url = url_for(@product.images[0])
  end

  def add_image_form
    @product = Product.find_by_id params[:id]
  end

  def add_image
    product = Product.find_by_id params[:id]
    product.images.attach(params[:product][:images])
    redirect_to show_product_path product
  end

  def get_images
    @product = Product.find_by_id params[:id]
    images = []
    @product.images.each do |img|
      images.append({'original': url_for(img),
       '100x100': url_for(img.variant(resize: "100x100"))})
    end
    render json: {id:params[:id], images: images}
  end

end

