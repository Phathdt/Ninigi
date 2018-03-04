module Api::V1
  class Auth::RegistrationsController < BaseApiController
    def create
      byebug
    end

    private

    def registration_params
      params.require(:users).permit(:email, :password, :password_confirmation)
    end
  end
end
