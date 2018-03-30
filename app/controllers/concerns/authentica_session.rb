module AuthenticaSession
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user, if: -> { current_user.nil? }
  end

  protected

  def authenticate_request!
    raise Error::NotAuthenticated unless token_presence?

    @session = Session.find_by(token: token, active: true)

    raise Error::TokenNotMatch unless @session

    @current_user = session.user
  end

  def token
    @token ||= request.headers['token']
  end

  def token_presence?
    !!token
  end

  def current_user
    @current_user
  end

  def session
    @session
  end

  def set_current_user
    return unless token_presence?

    @session = Session.find_by(token: token, active: true)
    return unless @session

    @current_user = session.user
  end
end
