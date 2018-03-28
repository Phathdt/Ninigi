class Restaurant < ApplicationRecord
  geocoded_by :address

  enum state: %i[pending approved suspended published]

  after_validation :geocode, if: :address_changed?

  belongs_to :user
end
