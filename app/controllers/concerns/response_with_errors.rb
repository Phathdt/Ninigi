module ResponseWithErrors
  extend ActiveSupport::Concern

  included do
    rescue_from Error::NotAuthenticated, with: :not_authenticated
    rescue_from Error::TokenNotMatch, with: :token_not_match
  end

  private

  def not_authenticated
    render json: { errors: I18n.t('.not_authenticated') }, status: :unauthorized
  end

  def token_not_match
    render json: { errors: I18n.t('.token_not_match') }, status: :unauthorized
    return
  end

  def record_not_found
    render json: { errors: I18n.t('.record_not_found') }, status: 404
    return
  end

end
