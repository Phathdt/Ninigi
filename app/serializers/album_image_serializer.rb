class AlbumImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :caption, :is_cover
  set_key_transform :camel_lower

  attribute :url, &:url
end
