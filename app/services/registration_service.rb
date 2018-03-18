class RegistrationService < BaseService
  def create(params)
    user = User.new(params)
    message = simple_create(user, options)
    if message[:notice]
      [{notice: I18n.t('devise.registrations.signed_up_but_inactive')}, :ok]
    else
      [{ errors: message[:errors] }, :unprocessable_entity]
    end
  end

  def active(params)
    user = User.find_by!(email: params[:email])
    if user.confirmation_token == params[:confirmation_token]
      user.confirm
      [{notice: I18n.t('devise.confirmations.confirmed')}, :ok]
    else
      [{notice: I18n.t('devise.confirmations.wrong_confirmation_token')}, :unprocessable_entity]
    end
  end
end
