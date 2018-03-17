class PasswordService < BaseService
  def create(params)
    user = User.find_by!(params)
    user.send_reset_password_instructions
    [ {notice: I18n.t('devise.passwords.send_instructions') }, :ok]
  end
end
