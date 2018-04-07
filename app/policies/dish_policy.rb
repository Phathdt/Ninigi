class DishPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :restaurant, :scope

    def initialize(user, restaurant, scope)
      @user  = user
      @scope = scope
      @restaurant = restaurant
    end

    def resolve
      return scope.all if restaurant.owner == user || restaurant.managers.where(id: user).exists?
      scope.where(is_public: true)
    end
  end

  def create?
    record.restaurant.owner == user ||
      record.restaurant.managers.where(id: user).exists?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end

  def toggle_active?
    create?
  end

  def toggle_public?
    create?
  end
end
