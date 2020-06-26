module ApplicationHelper
  class Image
    include Rails.application.routes.url_helpers
    include Kashmir
    #ImageProcessing::MiniMagick

    # def auto_orient
    #   manipulate! do |image|
    #     image.tap(&:auto_orient)
    #   end
    # end
    #
    # def clean_metadata
    #   manipulate! do |img|
    #     img.strip
    #     img = yield(img) if block_given?
    #     img
    #   end
    # end
    #
    # def crop_vertical
    #   if file && model
    #     width, height = ::MiniMagick::Image.open(file.file)[:dimensions]
    #     int_width = width.to_i
    #
    #     if int_width > 300
    #       offset = (10).to_s
    #       manipulate! do |image|
    #         image.combine_options do |c|
    #           c.crop '300x30000+' + offset + '+0'
    #           c.gravity 'Center'
    #         end
    #         image
    #       end
    #     end
    #
    #   end
    # end
    #
    # def mob_crop
    #   if file && model
    #     width, height = ::MiniMagick::Image.open(file.file)[:dimensions]
    #     int_width = width.to_i
    #
    #     if int_width > 150
    #       offset = (10).to_s
    #       manipulate! do |image|
    #         image.combine_options do |c|
    #           c.crop '150x150+' + offset + '+0'
    #           c.gravity 'Center'
    #         end
    #         image
    #       end
    #     end
    #
    #   end
    # end

    def initialize(img)
      @id = img.id

      @original = url_for(controller: 'active_storage/blobs',
                         action: :show,
                         signed_id: img.signed_id,
                         filename: img.filename)

      @v100_100 = Rails.application.routes.url_helpers.rails_representation_url(
          img.variant(resize: "100x100", strip:true).processed)

      @tiny = Rails.application.routes.url_helpers.rails_representation_url(
          img.variant(resize_to_fill: [150,150], strip:true).processed)


      @card_h = Rails.application.routes.url_helpers.rails_representation_url(
          img.variant(resize_to_fit: [4000,420], strip: true).processed)


      card_v_combined_options = { resize_to_fit: [4000, 420], gravity: 'center', strip: true}
      if img.blob.metadata[:width] > 300
        card_v_combined_options[:crop] = '300x3000+10+0'
      end
      @card_v = Rails.application.routes.url_helpers.rails_representation_url(
          img.variant(combine_options: card_v_combined_options).processed)

      @visor = Rails.application.routes.url_helpers.rails_representation_url(
          img.variant(resize_to_fit: [720, 405], strip: true).processed)

      @visor_prev = Rails.application.routes.url_helpers.rails_representation_url(
          img.variant(resize_to_fit: [160, 90], strip: true).processed)

      @room_card = Rails.application.routes.url_helpers.rails_representation_url(
          img.variant(resize_to_fit: [320,320], strip: true).processed)

      m_card_combined_options = { resize_to_fit: [4000, 420], gravity: 'center', strip: true}
      if img.blob.metadata[:width] > 150
        m_card_combined_options[:crop] = '150x150+10+0'
      end
      @m_card = Rails.application.routes.url_helpers.rails_representation_url(
          img.variant(combine_options: m_card_combined_options).processed)

    end

    # version :card_h do
    #   #process resize_to_fill: [288, 162]
    #   #process resize_to_fit: [288, 162]
    #   process resize_to_fit: [4000, 420]
    #   process :clean_metadata
    # end
    #
    # version :card_v do
    #   #process resize_to_fill: [214, 313]
    #   process resize_to_fit: [4000, 420]
    #   process :clean_metadata
    #   process :crop_vertical
    # end
    #
    # version :visor do
    #   #process resize_to_fill: [720, 405]
    #   process resize_to_fit: [720, 405]
    #   process :clean_metadata
    # end
    #
    # version :visor_prev do
    #   #process resize_to_fill: [160, 90]
    #   process resize_to_fit: [160, 90]
    # end
    #
    # version :room_card do
    #   #process resize_to_fill: [80,80]
    #   #process resize_to_fit: [80,80]
    #   process resize_to_fit: [320,320]
    #   process :clean_metadata
    # end
    #
    # version :m_card do
    #   process resize_to_fit: [4000, 150]
    #   process :clean_metadata
    #   process :mob_crop
    # end
    #
    # representations do
    #   rep :id
    #   rep :original
    #   rep :v100_100
    # end

    attr_reader :id
    attr_reader :original
    attr_reader :v100_100
    attr_reader :tiny
    attr_reader :card_h
    attr_reader :card_v
    attr_reader :visor
    attr_reader :visor_prev
    attr_reader :room_card
    attr_reader :m_card



  end

end