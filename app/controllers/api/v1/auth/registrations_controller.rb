module Api::V1
  class Auth::RegistrationsController < BaseApiController

    def create
      data, status = service.create(registration_params)
      render_json(data, status)
    end

    def active
      data, status = service.active(active_params)
      render_json(data, status)
    end

    private

    def registration_params
      params.require(:users).permit(:email, :password, :password_confirmation, :name)
    end

    def active_params
      params.require(:users).permit(:email, :confirmation_token)
    end
  end
end
