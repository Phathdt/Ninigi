class RestaurantPolicy < ApplicationPolicy
  def update?
    record.owner == user
  end

  def destroy?
    update?
  end

  def repending?
    update?
  end

  def published?
    update?
  end
end
