class ManagerRequestPolicy < ApplicationPolicy
  def index?
    record.restaurant.owner == user
  end

  def show?
    index? ||
      record.manager == user
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
    index? ||
      record.manager == user
  end

  def retire?
    index? ||
      record.manager == user
  end
end
