class RestaurantService < BaseService
  def index
    restaurants = Restaurant.all
    [restaurants, :ok]
  end

  def create(params)
    restaurant = current_user.restaurants.new(params)
    message = simple_create(restaurant, options)
    render_message(message)
  end

  def update(restaurant, params)
    message = simple_update(restaurant, params, options)
    render_message(message)
  end

  def destroy(restaurant)
    message = custom_destroy restaurant
  end
end
