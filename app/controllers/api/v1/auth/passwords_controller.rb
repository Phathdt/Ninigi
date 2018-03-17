module Api::V1
  class Auth::PasswordsController < BaseApiController
    before_action :authenticate_request!, only: %i[]

    def create
      data, status = service.create(password_params)
      render_json(data, status)
    end

    private

    def password_params
      params.require(:users).permit(:email)
    end
  end
end
