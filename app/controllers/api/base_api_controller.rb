class Api::BaseApiController < ActionController::API
  include AuthenticaSession
  include ResponseWithErrors
  include ResponseWithJson
  include Pundit

  before_action :service, :set_locale

  private

  def service
    return if controller_name == 'base_api' || controller_path.include?('admin')

    service ||= "#{controller_name.singularize.camelize}Service".constantize
    @service ||= service.new(current_user, controller_name, action_name)
  end

  def set_locale
    I18n.locale = current_user&.locale || I18n.default_locale
  end
end
