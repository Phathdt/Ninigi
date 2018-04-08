class Dish < ApplicationRecord
  include Photoable
  acts_as_paranoid

  has_attached_file :photo, styles: {
    mobile_small: '64x64>',
    medium: '275x275>',
    big: '600x600>'
  }

  belongs_to :restaurant

  validates_attachment :photo, size: { in: 0..MAX_FIZESIZE },
    content_type: { content_type: CONTENT_TYPE_PATTERN }
end
