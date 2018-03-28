class RestaurantSerializer < BaseSerializer
  attributes :address, :phone, :state, :latitude, :longitude
  set_type :restaurant
  set_key_transform :camel_lower

  attribute :id_dsada do |object|
    'Part 2'
  end
end
