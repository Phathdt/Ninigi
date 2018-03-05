class Api::BaseApiController < ActionController::API
  include AuthenticaSession
  include ResponseWithErrors
  include SimpleSave
  include SimpleDestroy

  before_action :service

  private

  def service
    service ||= "#{controller_name.singularize.capitalize}Service".constantize
    @service ||= service.new current_user
  end
end
