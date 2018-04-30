module CommonAttributes
  module Restaurant
    extend ActiveSupport::Concern

    included do
      attributes :address, :phone, :state, :latitude, :longitude, :state
      set_type :restaurant
      set_key_transform :camel_lower

      attribute :cover do |object|
        object.cover(scope[:size] || :medium)
      end


      attribute :rate do |restaurant|
        if restaurant.review_count.zero?
          0
        else
          ( restaurant.review_point / restaurant.review_count.to_f ).round(2)
        end
      end
    end
  end
end
