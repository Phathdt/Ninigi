module ResponseWithErrors
  extend ActiveSupport::Concern

  included do
    rescue_from Error::NotAuthenticated, with: :not_authenticated
    rescue_from Error::TokenNotMatch, with: :token_not_match
  end

  private

  def not_authenticated
    render_error(I18n.t('.not_authenticated'), :unauthorized)
  end

  def token_not_match
    render_error(I18n.t('.token_not_match'), :unauthorized)
  end

  def record_not_found
    render_error(I18n.t('.record_not_found'), :not_found)
  end

  def render_error(message, status)
    status_code = SYMBOL_TO_STATUS_CODE[status]
    render json: {
      error: { status: status_code, message: message }
    }, status: status
  end
end
