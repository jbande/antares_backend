class StaticImagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  include Rails.application.routes.url_helpers

  def index
    @static_image = StaticImage.all
  end

  def show
    @static_image = StaticImage.find_by_id params[:id]
  end


  def new
    @static_image = StaticImage.new
  end

  def create
    shop_uid = params.require(:shop_uid)
    page_position = params.require(:static_image).permit(:page_position)["page_position"]
    image = params.require(:static_image).permit(images: [])["images"][0]

    shop = Shop.find_by_uid shop_uid

    if shop
      static_image = shop.static_images.new(page_position:page_position)
      static_image.image = image
      static_image.save
      shop.static_images.append(static_image)
    end

    redirect_to static_images_show_path static_image
  end

  def edit
    @static_image = StaticImage.find_by_id(params[:id])
  end

  def update

    id = params.require(:static_image).require(:id)

    @static_image = StaticImage.find_by_id(id)

    attributes = params.require(:static_image).permit(:page_position, :id, images: [])

    if attributes.has_key? 'images'
      image = attributes[:images][0]
      @static_image.image = image
    end

    page_position = attributes[:page_position]

    @static_image.page_position = page_position

    @static_image.save

    redirect_to static_images_show_path @static_image
  end


  def add_image_form
    @static_image = StaticImage.new
  end

  def add_image
    product = StaticImage.find_by_id params[:id]
    product.images.attach(params[:product][:images])
    redirect_to show_product_path product
  end

  def get_images

    @static_image = StaticImage.find_by_id params[:id]
    images = []
    @static_image.images.each do |img|
      images.append({'original': url_for(img),
                     '100x100': url_for(img.variant(resize: "100x100"))})
    end
    render json: {id:params[:id], images: images}

  end

end

