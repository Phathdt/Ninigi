module AuthenticaSession
  extend ActiveSupport::Concern

  protected

  def authenticate_request!
    unless token_presence?
      raise Error::NotAuthenticated
    end

    session = Session.find_by(token: token, active: true)

    unless session
      raise Error::TokenNotMatch
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
