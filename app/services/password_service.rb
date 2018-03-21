class PasswordService < BaseService

  def create(params)
    user = User.find_by(email: params[:email].downcase)

    if user
      user.send_reset_password_instructions
      [ {notice: I18n.t('devise.passwords.send_instructions') }, :ok]
    else
      [{ errors: I18n.t('devise.failure.invalid_email') }, :unprocessable_entity]
    end
  end

  def edit(params)
    user = User.find_by(reset_password_token: params[:reset_password_token])

    if user
      [{notice: I18n.t('devise.passwords.new_password')}, :ok]
    else
      wrong
    end
  end

  def update(params)
    user = User.find_by(reset_password_token: params[:reset_password_token])

    return wrong unless user

    if params[:password].blank? || params[:password_confirmation].blank?
      params[:password] = "mot_chuoi"
      params[:password_confirmation] = "chuoi_khac"
    end

    message = simple_update(user, params.permit(:password, :password_confirmation), options)

    if message[:notice]
      [{notice: I18n.t('devise.passwords.updated')}, :ok]
    else
      [{ errors: message[:errors] }, :unprocessable_entity]
    end
  end

  def change(params)
    return wrong('password') unless current_user.valid_password? params[:old_password]

    if params.permit(:password).blank? || params.permit(:password_confirmation).blank?
      params[:password] = "mot_chuoi"
      params[:password_confirmation] = "chuoi_khac"
    end

    message = simple_update(current_user, params.permit(:password, :password_confirmation), options)

    if message[:notice]
      [{notice: I18n.t('devise.passwords.updated')}, :ok]
    else
      [{ errors: message[:errors] }, :unprocessable_entity]
    end
  end

  private

  def wrong(obj = 'token')
    [{ errors: I18n.t("devise.passwords.wrong_#{obj}") }, :unprocessable_entity]
  end
end
