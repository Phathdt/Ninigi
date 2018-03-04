module Api::V1
  class Auth::SessionsController < BaseApiController
    before_action :authenticate_request!, only: %i[destroy]

    def create
      message, status = service.create(session_params)
      render json: message, status: status
    end

    def destroy
      custom_destroy @session
    end

    private

    def session_params
      params.require(:users).permit(:email, :password)
    end
  end
end
