class PasswordService < BaseService

  def create(params)
    user = User.find_by!(params)
    user.send_reset_password_instructions
    [ {notice: I18n.t('devise.passwords.send_instructions') }, :ok]
  end

  def edit(params)
    user = User.find_by!(params)

    [{notice: I18n.t('devise.passwords.new_password')}, :ok]
  end

  def update(params)
    if params.permit(:reset_password_token).blank?
      return [{ errors: I18n.t('devise.passwords.wrong_token') }, :unprocessable_entity]
    end

    user = User.find_by!(params.permit(:reset_password_token))

    if params.permit(:password).blank? || params.permit(:password_confirmation).blank?
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
    unless current_user.valid_password? params[:old_password]
      return [{ errors: I18n.t('devise.passwords.wrong_password') }, :unprocessable_entity]
    end

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
end
