module Api::V1
  class Admin::AdminController < BaseApiController
    before_action :authorize_admin!

    private

    def authorize_admin!
      authenticate_request!

      raise Pundit::NotAuthorizedError unless current_user.has_role?(:admin)
    end
  end
end
