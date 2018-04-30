module NormalUser
  class DishService < BaseService
    def index(restaurant, page_number)
      dishes = DishPolicy::Scope.new(current_user, restaurant).resolve.page(page_number || 1)
      [dishes, :ok]
    end
  end
end
