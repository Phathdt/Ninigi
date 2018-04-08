class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user || User.new
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :restaurant

    def initialize(user, restaurant)
      @user  = user
      @restaurant = restaurant
    end

    def can_action?
      have_policy? || restaurant.publiced?
    end

    private

    def have_policy?
      restaurant.owner == user ||
        restaurant.managers.where(id: user).exists?
    end
  end
end
