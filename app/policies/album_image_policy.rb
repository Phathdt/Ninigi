class AlbumImagePolicy < ApplicationPolicy
  def destroy?
    record.restaurant.owner == user ||
      record.restaurant.managers.where(id: user).exists?
  end
end
