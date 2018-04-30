class RestaurantPolicy < ApplicationPolicy
  def update?
    record.owner == user
  end

  def destroy?
    update?
  end

  def repending?
    update? ||
      record.managers.where(id: user).exists?
  end

  def published?
    repending?
  end
end
