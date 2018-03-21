module Api::V1
  class RegistrationsController < BaseApiController

    def create
      data, status = service.create(registration_params)
      render_json(data, status)
    end

    private

    def registration_params
      params.require(:users).permit(:email, :password, :password_confirmation)
    end
  end
end
