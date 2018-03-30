module Api::V1
  class Admin::AdminController < BaseApiController
    before_action :authorize_admin!
    before_action :service_admin

    private

    def authorize_admin!
      authenticate_request!

      raise Pundit::NotAuthorizedError unless current_user.has_role?(:admin)
    end

    def service_admin
      service ||= "Admin::#{controller_name.singularize.capitalize}Service".constantize
      @service ||= service.new(current_user, controller_name, action_name)
    end
  end
end
