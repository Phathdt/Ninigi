class Review < ApplicationRecord
  acts_as_paranoid

  belongs_to :reviewable, polymorphic: true
  belongs_to :user
  has_many :images, dependent: :destroy
  counter_culture :reviewable, column_name: "review_point", delta_column: 'point'
  counter_culture :reviewable, column_name: "review_count"

  validates :point, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 5
  }

  accepts_nested_attributes_for :images, allow_destroy: true,
    reject_if: proc { |attributes| attributes['temp_url'].blank? }
end
