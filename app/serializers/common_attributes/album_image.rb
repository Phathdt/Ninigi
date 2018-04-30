module CommonAttributes
  module AlbumImage
    extend ActiveSupport::Concern

    included do
      attributes :caption, :is_cover
      set_key_transform :camel_lower

      attribute :url, &:url
    end
  end
end
