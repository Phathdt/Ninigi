module AuthenticaSession
  extend ActiveSupport::Concern

  protected

  def authenticate_request!
    unless token_presence?
      render json: { errors: I18n.t('.not_authenticated') }, status: :unauthorized
      return
    end

    session = Session.find_by(token: token, active: true)

    unless session
      render json: { errors: I18n.t('.not_match') }, status: :unauthorized
      return
    end

    @current_user = session.user
  end

  def token
    @token ||= request.headers['token']
  end

  def token_presence?
    token
  end

  def current_user
    @current_user
  end
end
