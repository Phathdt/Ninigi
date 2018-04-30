class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  default_scope { order("#{sti_name.pluralize.underscore}.created_at DESC") }

  scope :unscope_order, -> { unscope(:order) }
  scope :sample, -> { unscope_order.order('RANDOM()').first }
end
