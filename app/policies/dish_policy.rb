class DishPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return restaurant.dishes.includes(:variants) if have_policy?
      restaurant.dishes.where(is_public: true).includes(:variants)
    end

    def can_show?(dish)
      return true if dish.is_public?
      have_policy?
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
