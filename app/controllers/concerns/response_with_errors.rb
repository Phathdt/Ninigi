module ResponseWithErrors
  extend ActiveSupport::Concern

  included do
    rescue_from Error::NotAuthenticated, with: :not_authenticated
    rescue_from Error::TokenNotMatch, with: :token_not_match
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    rescue_from ActionController::ParameterMissing, with: :params_missing
  end

  def routing_error
    render_error(I18n.t('routing.errors.messages.routing_error'), :unprocessable_entity)
  end

  private

  def not_authenticated
    render_error(I18n.t('devise.failure.unauthenticated'), :unauthorized)
  end

  def token_not_match
    render_error(I18n.t('devise.failure.invalid_token'), :unauthorized)
  end

  def record_not_found(exception)
    exception.message =~ /^Couldn't find (\w+) with 'id'/
    render_error(I18n.t('activerecord.exceptions.not_found', klass: I18n.t("activerecord.models.#{$1.underscore}")), :not_found)
  end

  def user_not_authorized
    render_error(I18n.t('pundit.user_not_authorized'), :unauthorized)
  end

  def params_missing
    render_error(I18n.t('actioncontroller.errors.messages.missing_params'), :internal_server_error)
  end

  def render_error(message, status)
    render json: {
      error: { message: message }
    }, status: status
  end
end
