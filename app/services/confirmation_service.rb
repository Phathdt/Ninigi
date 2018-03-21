class ConfirmationService < BaseService

  def show(params)
    user = User.find_by(confirmation_token: params[:confirmation_token])
    if user
      user.confirm
      [{notice: I18n.t('devise.confirmations.confirmed')}, :ok]
    else
      [{notice: I18n.t('devise.confirmations.wrong_confirmation_token')}, :unprocessable_entity]
    end
  end

  def create(params)
    user = User.find_by(email: params[:email].downcase)
    if user
      user.send_confirmation_instructions
      [{notice: I18n.t('devise.confirmations.send_instructions')}, :ok]
    else
      [{notice: I18n.t('devise.failure.invalid_email')}, :unprocessable_entity]
    end
  end

end
