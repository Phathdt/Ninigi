class ManagerRequestPolicy < ApplicationPolicy
  def index?
    record.restaurant.owner == user
  end

  def show?
    index?
  end

  def create?
    index?
  end

  def approve?
    record.manager == user
  end

  def repending?
    index?
  end

  def reject?
    record.manager == user
  end

  def retire?
    index?
  end
end
