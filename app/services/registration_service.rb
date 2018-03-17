class RegistrationService < BaseService
  def create(params)
    user = User.new(params)
    message = simple_create(user, options)
    if message[:notice]
      session = user.sessions.first
      [session, :ok]
    else
      [{ errors: message[:errors] }, :unprocessable_entity]
    end
  end
end
