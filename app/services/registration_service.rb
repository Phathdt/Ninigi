class RegistrationService < BaseService
  def create(params)
    user = User.new(params)
    message = simple_create(user, options)
    if message[:notice]
      [{ notice: I18n.t('devise.registrations.signed_up_but_inactive')}, :ok]
    else
      [{ errors: message[:errors] }, :unprocessable_entity]
    end
  end
end
