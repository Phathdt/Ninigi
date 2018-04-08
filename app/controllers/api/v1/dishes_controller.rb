module Api::V1
  class DishesController < BaseApiController
    prepend_before_action :authenticate_request!, only: %i[create update destroy toggle_active toggle_public]
    before_action :find_restaurant, only: %i[index create]
    before_action :find_dish, only: %i[show update destroy toggle_active toggle_public]
    before_action :authorize_dish, only: %i[update destroy toggle_active toggle_public]

    def index
      return render_missing_restaurant unless can_action?(current_user, @restaurant)
      data, status = service.index(@restaurant, params[:page])
      render_json(data, status)
    end

    def create
      authorize @restaurant.dishes.new
      data, status = service.create(@restaurant, dish_params)
      render_json(data, status)
    end

    def show
      return render_missing_restaurant unless can_action?(current_user, @dish.restaurant)
      return render_missing_dish unless can_show?(current_user, @dish.restaurant, @dish)
      render_json(@dish, :ok)
    end

    def update
      data, status = service.update(@dish, dish_params)
      render_json(data, status)
    end

    def destroy
      data, status = service.destroy(@dish)
      render_json(data, status)
    end

    def toggle_active
      @dish.toggle! :is_active
      render json: {}, status: :ok
    end

    def toggle_public
      @dish.toggle! :is_public
      render json: {}, status: :ok
    end

    private

    def find_restaurant
      @restaurant ||= Restaurant.find(params[:restaurant_id])
    end

    def find_dish
      @dish ||= Dish.find(params[:id])
    end

    def dish_params
      params.require(:dishes).permit(:name, :description, :temp_url,
        variants_attrs)
    end

    def variants_attrs
      { variants_attributes: %i[id size price _destroy] }
    end

    def authorize_dish
      authorize @dish
    end

    def can_action?(user, restaurant)
      DishPolicy::Scope.new(user || User.new, restaurant).can_action?
    end

    def can_show?(user, restaurant, dish)
      DishPolicy::Scope.new(user || User.new, restaurant).can_show?(dish)
    end

    def render_missing_dish
      render json: {
        message: I18n.t('activerecord.exceptions.not_found',
          klass: I18n.t('activerecord.models.dish'))
      }, status: :unprocessable_entity
    end
  end
end
