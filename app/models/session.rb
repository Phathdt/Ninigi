class Session < ApplicationRecord
  belongs_to :user

  def expired?
    !active? || ( Time.now > created_at + EXPIRED_TIME )
  end
end
