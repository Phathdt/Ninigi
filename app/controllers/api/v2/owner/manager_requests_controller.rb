module Api::V2
  class Owner::ManagerRequestsController < Owner::OwnerController
    before_action :find_restaurant, only: %i[index create]
    before_action :find_manager_request, only: %i[show destroy approve repending reject retire]

    def index
      authorize @restaurant.manager_requests.first_or_initialize
      data, status = service.index(@restaurant, list_manager_request_params)
      render_json(data, status)
    end

    def show
      authorize @manager_request
      render_json(@manager_request, :ok)
    end

    def create
      authorize @restaurant.manager_requests.first_or_initialize
      data, status = service.create(@restaurant, manager_request_params)
      render_json(data, status)
    end

    def approve
      authorize @manager_request
      data, status = service.approve(@manager_request)
      render_json(data, status)
    end

    def repending
      authorize @manager_request
      data, status = service.repending(@manager_request)
      render_json(data, status)
    end

    def reject
      authorize @manager_request
      data, status = service.reject(@manager_request, comment_params)
      render_json(data, status)
    end

    def retire
      authorize @manager_request
      data, status = service.retire(@manager_request, comment_params)
      render_json(data, status)
    end

    private

    def find_restaurant
      @restaurant ||= Restaurant.find(params[:restaurant_id])
    end

    def find_manager_request
      @manager_request ||= ManagerRequest.find(params[:id])
    end

    def list_manager_request_params
      params.permit(:state, :page)
    end

    def manager_request_params
      params.require(:manager_request).permit(:user_id)
    end

    def comment_params
      params.require(:manager_request).permit(:comment)
    end
  end
end
