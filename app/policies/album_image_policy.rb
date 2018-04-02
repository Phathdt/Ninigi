class AlbumImagePolicy < ApplicationPolicy
  def destroy?
    record.restaurant.owner == user
  end
end
