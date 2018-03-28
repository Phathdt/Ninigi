module Api::V1
  class RestaurantsController < BaseApiController
    def index
      data, status = service.index
      render_json(data, status)
    end

    def show
      data, status = service.show(params[:id])
      render_json(data, status)
    end

    def create; end
  end
end
