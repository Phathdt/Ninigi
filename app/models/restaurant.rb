class Restaurant < ApplicationRecord
  geocoded_by :address

  enum state: %i[pending approved suspended published]

  after_validation :geocode, if: :address_changed?
  after_validation :update_name_unicode, if: -> { name_changed? || name_unicode.blank? }

  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'

  validates :name, :address, presence: true, length: { minimum: 1, maximum: 254 }
  validates :desc, length: { minimum: 0, maximum: DESC_MAX_LENGTH }
  validates :phone, length: { minimum: 10, maximum: 15 }

  private

  def update_name_unicode
    self.name_unicode = name.no_unicode
  end
end
