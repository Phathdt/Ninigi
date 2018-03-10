class RegistrationService < BaseService
  def create(params)
    user = User.new(params)
    message = simple_create(user, options)
    if message[:notice]
      token = user.sessions.create.token
      [{ token: token }, :ok]
    else
      [{ errors: message[:errors] }, :unprocessable_entity]
    end
  end
end
