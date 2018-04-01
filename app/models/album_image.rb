class AlbumImage < ApplicationRecord
  acts_as_paranoid

  has_attached_file :photo, styles: {
    small: '300x215>',
    medium: '400x270>',
    large: '1920x1080>'
  }

  belongs_to :restaurant

  validates_attachment :photo, size: { in: 0..MAX_FIZESIZE },
    content_type: { content_type: CONTENT_TYPE_PATTERN }
  validates :caption, presence: true, length: { minimum: 1, maximum: 254 }
  validates :temp_url, presence: true, unless: Proc.new { |album_image| album_image.photo.exists? }

  after_create { ProcessImagesJob.perform_later(self) }

  def self.cover
    find_by(is_cover: true)
  end

  def url(version = :original)
    temp_url || photo.url(version)
  end
end
