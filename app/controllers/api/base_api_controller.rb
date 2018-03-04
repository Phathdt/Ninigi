class Api::BaseApiController < ActionController::API
  include AuthenticaSession
  include ResponseWithErrors
  include SimpleSave

  before_action :authenticate_request!
  before_action :install_service

  private

  def install_service
    service = "#{controller_name.singularize.capitalize}Service".constantize
    @service ||= service.new current_user
  end
end
