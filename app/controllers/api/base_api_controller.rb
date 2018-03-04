class Api::BaseApiController < ActionController::API
  include AuthenticaSession
  include SimpleSave

  before_action :authenticate_request!
  before_action :install_service

  private

  def install_service
    current_user = ''
    @service ||= "#{controller_name.singularize.capitalize}Service".constantize.new current_user
  end
end
