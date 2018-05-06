module Api::V2
  class UploadsController < BaseApiController
    prepend_before_action :authenticate_request!, only: %i[create]

    def create
      data, status = service.create(upload_params)
      render_json(data, status)
    end

    private

    def upload_params
      params.permit(:file)
    end
  end
end
