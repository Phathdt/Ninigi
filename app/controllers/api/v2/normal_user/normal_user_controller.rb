module Api::V2
  class NormalUser::NormalUserController < BaseApiController
    include ::NormalUser::ResponseWithJson

    before_action :service

    private

    def service
      service ||= "NormalUser::#{controller_name.singularize.camelize}Service".constantize
      @service ||= service.new(current_user, controller_name, action_name)
    end
  end
end
