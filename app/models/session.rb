class Session < ApplicationRecord
  belongs_to :user

  def expired?
    !active? || (Time.current > created_at + EXPIRED_TIME)
  end
end
