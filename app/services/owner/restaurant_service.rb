module Owner
  class RestaurantService < BaseService
    def index(page_number)
      restaurants = current_user.restaurants.page(page_number || 1)
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

    def repending(restaurant)
      return render_state_error unless restaurant.may_repending?
      restaurant.repending!
      [{ notice: I18n.t('restaurants.state.approve') }, :ok]
    end

    def published(restaurant)
      return render_state_error unless restaurant.may_published?
      restaurant.published!
      [{ notice: I18n.t('restaurants.state.published') }, :ok]
    end

    private

    def render_state_error
      [{ message: I18n.t('restaurants.state.error') }, :unprocessable_entity]
    end
  end
end
