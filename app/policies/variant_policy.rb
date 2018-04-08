class VariantPolicy < ApplicationPolicy
  def create?
    record.dish.restaurant.owner == user ||
      record.dish.restaurant.managers.where(id: user).exists?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
