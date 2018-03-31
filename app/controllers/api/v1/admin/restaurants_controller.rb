module Api::V1
  class Admin::RestaurantsController < Admin::AdminController
    def index
      data, status = service_admin.index(params[:page])
      render_json(data, status)
    end
  end
end
