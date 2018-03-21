class SessionService < BaseService
  def create(params)
    user = User.find_by(email: params[:email].downcase)

    if user&.valid_password?(params[:password])
      return [{ message: I18n.t('devise.registrations.signed_up_but_inactive') }, :unprocessable_entity] unless user.confirmed?

      session = user.sessions.create
      [session, :ok]
    else
      [{ message: I18n.t('devise.failure.not_found_in_database') }, :unprocessable_entity]
    end
  end

  def destroy(record)
    data, message = custom_destroy record
    if message == :ok
      [{ notice: I18n.t('devise.sessions.signed_out') }, :ok]
    else
      [data, :unprocessable_entity]
    end
  end
end
