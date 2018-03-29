class RestaurantService < BaseService
  def index
    restaurants = Restaurant.all
    [restaurants, :ok]
  end

  def show(id)
    restaurant = Restaurant.find(id)
    [restaurant, :ok]
  end

  def create(params)
    restaurant = current_user.restaurants.new(params)
    message = simple_create(restaurant, options)
    render_message(message)
  end
end
