module Api::V1
  class Auth::SessionsController < BaseApiController
    before_action :authenticate_request!, only: %i[]
    before_action :install_service, only: %i[]

    def create
      user = User.find_by(email: session_params[:email])

      if user && user.valid_password?( session_params[:password])
        token = user.sessions.create.reload.token
        render json: { token: token }, status: 200
      else
        render json: { message: t('.sign_in_fail') }, status: 406
      end
    end

    private

    def session_params
      params.require(:users).permit(:email, :password)
    end
  end
end
