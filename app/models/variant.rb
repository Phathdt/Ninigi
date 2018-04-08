class Variant < ApplicationRecord
  acts_as_paranoid

  belongs_to :dish

  validates :size, inclusion: { in: %w(small medium large) }
  validates :price, numericality: { only_integer: true, greater_than: 0 }
  validate :check_presence_size, on: :create
  validate :check_presence_size_when_update, on: :update

  before_destroy :check_is_the_last_variant

  private

  def check_presence_size
    arr_size = dish.variants.map(&:size)
    size_duplicate = arr_size.detect{ |e| arr_size.count(e) > 1 }
    errors.add(:base, I18n.t('activerecord.errors.models.dish.attributes.variants.duplicate_size', size: I18n.t("size.#{size_duplicate}") )) if size_duplicate
  end

  def check_presence_size_when_update
    arr_size = dish.variants.where.not(id: id).map(&:size)
    dupplicate_size = arr_size.include?(size)
    errors.add(:base, I18n.t('activerecord.errors.models.dish.attributes.variants.duplicate_size', size: I18n.t("size.#{size}") )) if dupplicate_size
  end

  def check_is_the_last_variant
    return unless dish.variants.size == 1
    errors.add(:base, I18n.t('activerecord.errors.models.dish.attributes.variants.at_least_one_variant'))
    throw(:abort)
  end
end
