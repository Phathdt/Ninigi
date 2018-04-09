class Dish < ApplicationRecord
  include Photoable
  include Reviewable
  acts_as_paranoid

  has_attached_file :photo, styles: {
    mobile_small: '64x64>',
    medium: '275x275>',
    big: '600x600>'
  }

  belongs_to :restaurant
  has_many :variants, dependent: :destroy

  accepts_nested_attributes_for :variants, allow_destroy: true,
   reject_if: proc { |attributes| attributes['price'].blank? }

  validates_attachment :photo, size: { in: 0..MAX_FIZESIZE },
    content_type: { content_type: CONTENT_TYPE_PATTERN }
  validate :at_least_one_variant
  validate :check_duplicate_size_variant

  private

  def at_least_one_variant
    errors.add(:base, I18n.t('activerecord.errors.models.dish.attributes.variants.at_least_one_variant')) if variants.empty?
  end

  def check_duplicate_size_variant
    arr_size = variants.map(&:size)
    size_duplicate = arr_size.detect { |e| arr_size.count(e) > 1 }
    errors.add(:base, I18n.t('activerecord.errors.models.dish.attributes.variants.duplicate_size', size: I18n.t("size.#{size_duplicate}"))) if size_duplicate
  end
end
