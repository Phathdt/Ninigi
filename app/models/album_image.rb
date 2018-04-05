class AlbumImage < ApplicationRecord
  include Photoable
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

  before_destroy :check_is_cover

  def self.cover
    find_by(is_cover: true)
  end

  private

  def check_is_cover
    return unless is_cover?
    errors.add(:base, I18n.t('activerecord.errors.models.album_images.at_least_one_cover'))
    throw(:abort)
  end
end
