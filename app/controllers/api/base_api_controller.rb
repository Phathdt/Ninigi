class Api::BaseApiController < ActionController::API
  include AuthenticaSession
  include ResponseWithErrors
  include ResponseWithJson

  before_action :service, :set_locale

  private

  def service
    service ||= "#{controller_name.singularize.capitalize}Service".constantize
    @service ||= service.new(current_user, controller_name, action_name)
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
