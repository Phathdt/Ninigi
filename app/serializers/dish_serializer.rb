class DishSerializer < BaseSerializer
  attributes :name, :description, :is_active, :is_public
  set_type :dish
  set_key_transform :camel_lower

  attribute :cover do |object|
    object.url(scope[:size] || :medium)
  end

  attribute :rate do |dish|
    return 0 if dish.review_count == 0
    (dish.review_point / dish.review_count.to_f).round(2)
  end

  attribute :variants do |object|
    object.variants.map do |variant|
      {
        id: variant.id,
        size: I18n.t("size.#{variant.size}"),
        price: variant.price
      }
    end
  end
end
