class ReviewPolicy < ApplicationPolicy
  def destroy?
    record.reviewable.owner == user ||
      record.reviewable.managers.where(id: user).exists?
  end
end
