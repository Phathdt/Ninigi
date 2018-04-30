module Api::V2
  class Admin::RestaurantsController < Admin::AdminController
    before_action :find_restaurant, only: %i[show approve reject]

    def index
      data, status = service.index(params[:page])
      render_json(data, status)
    end

    def show
      render_json(@restaurant, :ok)
    end

    def approve
      data, status = service.approve(@restaurant)
      render_json(data, status)
    end

    def reject
      data, status = service.reject(@restaurant, reject_params)
      render_json(data, status)
    end

    private

    def find_restaurant
      @restaurant ||= Restaurant.find(params[:id])
    end

    def reject_params
      params.require(:restaurants).permit(:comment)
    end
  end
end
