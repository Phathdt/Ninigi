class Api::BaseApiController < ActionController::API
  include AuthenticaSession
  include ResponseWithErrors
  include ResponseWithJson

  before_action :service, :set_locale

  private

  def service
    return if controller_name == 'base_api'

    service ||= "#{controller_name.singularize.capitalize}Service".constantize
    @service ||= service.new(current_user, controller_name, action_name)
  end

  def set_locale
    I18n.locale = current_user&.locale || I18n.default_locale
  end
end
