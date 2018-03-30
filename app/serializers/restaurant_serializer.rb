class RestaurantSerializer < BaseSerializer
  attributes :address, :phone, :state, :latitude, :longitude
  set_type :restaurant
  set_key_transform :camel_lower

  attribute :isAdmin do |object|
    current_user.has_role?(:admin) ? "tao la admin tao co quyen" : {"em la thuong dan": 1}
  end
end
