module CommonAttributes
  module Dish
    extend ActiveSupport::Concern

    included do
      attributes :name, :description, :is_active, :is_public
      set_type :dish
      set_key_transform :camel_lower

      attribute :cover do |object|
        object.url(scope[:size] || :medium)
      end

      attribute :rate do |dish|
        if dish.review_count.zero?
          0
        else
          (dish.review_point / dish.review_count.to_f).round(2)
        end
      end

      attribute :price do |object|
        object.variants.map(&:price).min
      end
    end
  end
end
