class RestaurantPolicy < ApplicationPolicy
  def update?
    user.has_any_role?(:admin) ||
      record.owner == user
  end

  def destroy?
    user.has_any_role?(:admin) ||
      record.owner == user
  end
end
