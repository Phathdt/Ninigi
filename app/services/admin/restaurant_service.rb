module Admin
  class RestaurantService < BaseService
    def index(page_number)
      restaurants = Restaurant.page(page_number || 1)
      [restaurants, :ok]
    end

    def approve(restaurant)
      return render_state_error unless restaurant.may_approve?
      restaurant.approve!
      [{ notice: I18n.t('restaurants.state.approve') }, :ok]
    end

    def reject(restaurant, reject_params)
      return render_state_error unless restaurant.may_reject?
      restaurant.comment = reject_params[:comment]

      return [{ notice: I18n.t('restaurants.state.reject') }, :ok] if restaurant.reject!
      [{ message: restaurant.errors.full_messages.first }, :unprocessable_entity]
    end

    private

    def render_state_error
      [{ message: I18n.t('restaurants.state.error') }, :unprocessable_entity]
    end
  end
end
