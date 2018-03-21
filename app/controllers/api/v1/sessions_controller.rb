module Api::V1
  class SessionsController < BaseApiController
    prepend_before_action :authenticate_request!, only: %i[destroy]

    def create
      data, status = service.create(session_params)
      render_json(data, status)
    end

    def destroy
      data, status = service.destroy(@session)
      render_json(data, status)
    end

    private

    def session_params
      params.require(:users).permit(:email, :password)
    end
  end
end
