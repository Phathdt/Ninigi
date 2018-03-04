module Api::V1
  class Auth::RegistrationsController < BaseApiController
    before_action :authenticate_request!, only: %i[abc]
    before_action :install_service, only: %i[]

    def create
      @user = User.new(registration_params)
      message = simple_create(@user)
      session = @user.sessions.create.reload
    end

    private

    def registration_params
      params.require(:users).permit(:email, :password, :password_confirmation)
    end
  end
end
