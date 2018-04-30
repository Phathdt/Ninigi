class Owner::DishSerializer < BaseSerializer
  include ::CommonAttributes::Dish

  attribute :price do |object|
    object.variants.map(&:price).min
  end
end
