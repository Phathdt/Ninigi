class Image < ApplicationRecord
  include Photoable
  acts_as_paranoid

  has_attached_file :photo, styles: {
    small: '300x215>',
    medium: '400x270>',
    large: '1920x1080>'
  }

  belongs_to :review

  validates_attachment :photo, size: { in: 0..MAX_FIZESIZE },
    content_type: { content_type: CONTENT_TYPE_PATTERN }
end
