module Admin
  class RestaurantService < BaseService
    def index(page_number)
      restaurants = Restaurant.page(page_number || 1)
      [restaurants, :ok]
    end
  end
end
