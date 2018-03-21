class SessionService < BaseService
  def create(params)
    user = User.find_by(email: params[:email].downcase)

    if user&.valid_password?(params[:password])
      if user.confirmed?
        session = user.sessions.create
        [session, :ok]
      else
        [{ message: I18n.t('devise.registrations.signed_up_but_inactive') }, 406]
      end
    else
      [{ message: I18n.t('devise.failure.not_found_in_database') }, 406]
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
