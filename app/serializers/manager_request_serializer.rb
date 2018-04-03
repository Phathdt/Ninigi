class ManagerRequestSerializer
  include FastJsonapi::ObjectSerializer
  attributes :state, :comment, :updated_at
  set_key_transform :camel_lower

  attribute :managers do |object|
    manager = object.manager
    {
      name: manager.name,
      email: manager.email
    }
  end
end
