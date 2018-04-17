class RestaurantSerializer < BaseSerializer
  attributes :address, :phone, :state, :latitude, :longitude
  set_type :restaurant
  set_key_transform :camel_lower

  attribute :cover do |object|
    object.cover(scope[:size] || :medium)
  end

  # attribute :rate do |restaurant|
  #   return 0 if restaurant.review_count == 0
  #   ( restaurant.review_point / restaurant.review_count.to_f ).round(2)
  # end

  attribute :extendAttributes do |object|
    scope[:current_user].has_role?(:admin) ? 'tao la admin tao co quyen' : { "em la thuong dan": 1 }
  end
end
