class RestaurantService < BaseService
  def index
    restaurants = Restaurant.all
    [restaurants, :ok]
  end

  def show(id)
    restaurant = Restaurant.find(id)
    [restaurant, :ok]
  end
end
