class DishSerializer < BaseSerializer
  attributes :name, :description, :price, :is_active, :is_public
  set_type :dish
  set_key_transform :camel_lower

  attribute :cover do |object|
    object.url(scope[:size] || :medium)
  end
end
