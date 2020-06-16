module ApplicationHelper
  class Image
    include Rails.application.routes.url_helpers
    include Kashmir

    def initialize(img)
      @id = img.id

      @original = url_for(controller: 'active_storage/blobs',
                         action: :show,
                         signed_id: img.signed_id,
                         filename: img.filename)

      @v100_100 = Rails.application.routes.url_helpers.rails_representation_url(
          img.variant(resize: "100x100").processed)

    end

    representations do
      rep :id
      rep :original
      rep :v100_100
    end

    attr_reader :id
    attr_reader :original
    attr_reader :v100_100


  end
end