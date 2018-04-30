module Api::V2
  class NormalUser::RestaurantsController < NormalUser::NormalUserController
    before_action :find_restaurant, only: %i[show]

    def index
      data, status = service.index(params[:page])
      render_json(data, status)
    end

    def show
      render_json(@restaurant, :ok)
    end

    private

    def find_restaurant
      @restaurant ||= Restaurant.where(state: :publiced).find(params[:id])
    end
  end
end
