module Api::V2
  class Authentication::RegistrationsController < Authentication::AuthenticationController
    def create
      data, status = service.create(registration_params)
      render_json(data, status)
    end

    private

    def registration_params
      params.require(:users).permit(:email, :password, :password_confirmation, :name)
    end
  end
end
