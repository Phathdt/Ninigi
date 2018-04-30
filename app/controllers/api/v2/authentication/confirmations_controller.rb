module Api::V2
  class Authentication::ConfirmationsController < Authentication::AuthenticationController
    def show
      data, status = service.show(params)
      render_json(data, status)
    end

    def create
      data, status = service.create(reconfirm_params)
      render_json(data, status)
    end

    private

    def reconfirm_params
      params.require(:users).permit(:email)
    end
  end
end
