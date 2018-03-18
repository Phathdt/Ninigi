class SessionService < BaseService
  def create(params)
    user = User.find_by(email: params[:email])

    if user&.valid_password?(params[:password])
      session = user.sessions.create
      [session, :ok]
    else
      [{ message: I18n.t('.sign_in_fail') }, 406]
    end
  end

  def destroy(record)
    data, message = custom_destroy record
    if message == :ok
      [{notice: I18n.t('devise.sessions.signed_out')}, :ok]
    else
      [data, :unprocessable_entity]
    end
  end
end
