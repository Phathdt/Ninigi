class RestaurantService < BaseService
  def index
    restaurants = Restaurant.all
    [restaurants, :ok]
  end

  def create(params)
    restaurant = current_user.restaurants.new(params)
    message = simple_create(restaurant, options)
    current_user.add_role(:owner) if message[:notice]
    render_message(message)
  end

  def update(restaurant, params)
    message = simple_update(restaurant, params, options)
    render_message(message)
  end

  def destroy(restaurant)
    owner = restaurant.owner
    message = custom_destroy restaurant
    owner.remove_role(:owner) if message.last == :ok && owner.restaurants.blank?
    message
  end
end
