class SessionService < BaseService
  def create(params)
    user = User.find_by(email: params[:email])

    message, status =
      if user&.valid_password?(params[:password])
        token = user.sessions.create.reload.token
        [{ token: token }, 200]
      else
        [{ message: I18n.t('.sign_in_fail') }, 406]
      end
  end
end
