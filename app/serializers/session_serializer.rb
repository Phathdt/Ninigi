class SessionSerializer < ActiveModel::Serializer
  attributes :token, :roles

  def roles
    object.user.roles.pluck(:name)
  end
end
