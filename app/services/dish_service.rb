class DishService < BaseService
  def index(restaurant, page_number)
    dishes = DishPolicy::Scope.new(current_user, restaurant, Dish).resolve.page(page_number || 1)
    [dishes, :ok]
  end

  def create(restaurant, dish_params)
    dish = restaurant.dishes.new(dish_params)
    message = simple_create(dish, options)
    render_message(message)
  end

  def update(dish, dish_params)
    message = simple_update(dish, dish_params, options)
    render_message(message)
  end

  def destroy(dish)
    message = custom_destroy dish
    message
  end
end
