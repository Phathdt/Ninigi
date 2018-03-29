module Api::V1
  class RestaurantsController < BaseApiController
    prepend_before_action :authenticate_request!, only: %i[create]

    def index
      data, status = service.index
      render_json(data, status)
    end

    def show
      data, status = service.show(params[:id])
      render_json(data, status)
    end

    def create
      data, status = service.create(restaurant_params)
      render_json(data, status)
    end

    private

    def restaurant_params
      params.require(:restaurants).permit(:name, :address, :phone, :desc)
    end
  end
end
