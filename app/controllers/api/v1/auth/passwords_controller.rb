module Api::V1
  class Auth::PasswordsController < BaseApiController
    prepend_before_action :authenticate_request!, only: %i[change]

    def create
      data, status = service.create(password_params)
      render_json(data, status)
    end

    def edit
      data, status = service.edit(token_params)
      render_json(data, status)
    end

    def update
      data, status = service.update(reset_password_params)
      render_json(data, status)
    end

    def change
      data, status = service.change(change_password_params)
      render_json(data, status)
    end

    private

    def password_params
      params.require(:users).permit(:email)
    end

    def token_params
      params.require(:users).permit(:reset_password_token)
    end

    def reset_password_params
      params.require(:users).permit(:reset_password_token, :password, :password_confirmation)
    end

    def change_password_params
      params.require(:users).permit(:old_password, :password, :password_confirmation)
    end
  end
end
