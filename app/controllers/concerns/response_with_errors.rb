module ResponseWithErrors
  extend ActiveSupport::Concern

  included do
    rescue_from Error::NotAuthenticated, with: :not_authenticated
    rescue_from Error::TokenNotMatch, with: :token_not_match
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  end

  private

  def not_authenticated
    render_error(I18n.t('devise.failure.invalid'), :unauthorized)
  end

  def token_not_match
    render_error(I18n.t('devise.failure.invalid_token'), :unauthorized)
  end

  def record_not_found(exception)
    class_object = exception.message.match(/Couldn't find ([\w]+)/)[1]
    render_error(I18n.t('activerecord.errors.messages.record_not_found', resourse: class_object), :not_found)
  end

  def render_error(message, status)
    render json: {
      error: { message: message }
    }, status: status
  end
end
