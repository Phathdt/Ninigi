module CommonAttributes
  module ManagerRequest
    extend ActiveSupport::Concern

    included do
      attributes :state, :comment, :updated_at
      set_key_transform :camel_lower

      attribute :restaurant do |object|
        restaurant = object.restaurant
        {
          name: restaurant.name,
          address: restaurant.address
        }
      end

      attribute :owner do |object|
        owner = object.restaurant.owner
        {
          name: owner.name,
          email: owner.email
        }
      end
    end
  end
end
