module Api::V1
  class Auth::RegistrationsController < BaseApiController
    before_action :authenticate_request!, only: %i[]
    before_action :service, only: %i[]

    def create
      @user = User.new(registration_params)
      message = simple_create(@user)
      token = @user.sessions.create.reload.token
      render_json({ token: token }, :success)
    end

    private

    def registration_params
      params.require(:users).permit(:email, :password, :password_confirmation, :name)
    end
  end
end
