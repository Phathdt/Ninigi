class DishPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :restaurant

    def initialize(user, restaurant)
      @user  = user
      @restaurant = restaurant
    end

    def resolve
      return restaurant.dishes if restaurant.owner == user || restaurant.managers.where(id: user).exists?
      restaurant.dishes.where(is_public: true)
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
