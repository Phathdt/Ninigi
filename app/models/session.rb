class Session < ApplicationRecord
  belongs_to :user

  before_create :generate_code

  def expired?
    !active? || (Time.current > created_at + EXPIRED_TIME)
  end

  private

  def generate_code
    self.token = SecureRandom.base64(TOKEN_LENGTH)
  end
end
