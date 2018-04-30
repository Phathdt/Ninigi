module Api::V2
  class NormalUser::ManagerRequestsController < NormalUser::NormalUserController
    before_action :find_manager_request, only: %i[show approve reject retire]

    def index
      data, status = service.index(params[:page])
      render_json(data, status)
    end

    def show
      authorize @manager_request
      render_json(@manager_request, :ok)
    end

    def approve
      authorize @manager_request
      data, status = service.approve(@manager_request)
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

    def find_manager_request
      @manager_request ||= ManagerRequest.find(params[:id])
    end

    def comment_params
      params.require(:manager_request).permit(:comment)
    end
  end
end
