module Api::V2
  class User::UserController < BaseApiController
    include ::User::ResponseWithJson

    before_action :authorize_admin!
    before_action :service

    private

    def authorize_admin!
      authenticate_request!

      raise Pundit::NotAuthorizedError unless current_user.has_any_role?(:owner, :manager)
    end

    def service
      service ||= "User::#{controller_name.singularize.camelize}Service".constantize
      @service ||= service.new(current_user, controller_name, action_name)
    end
  end
end
