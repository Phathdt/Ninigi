module Api::V1
  class RestaurantsController < BaseApiController
    prepend_before_action :authenticate_request!, only: %i[create update destroy]
    before_action :find_restaurant, only: %i[show update destroy]

    def index
      data, status = service.index
      render_json(data, status)
    end

    def show
      render_json(@restaurant, :ok)
    end

    def create
      data, status = service.create(restaurant_params)
      render_json(data, status)
    end

    def update
      authorize @restaurant
      data, status = service.update(@restaurant, restaurant_params)
      render_json(data, status)
    end

    def destroy
      authorize @restaurant
      data, status = service.destroy(@restaurant)
      render_json(data, status)
    end

    private

    def find_restaurant
      @restaurant ||= Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurants).permit(:name, :address, :phone, :desc)
    end
  end
end
