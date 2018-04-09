module Reviewable
  extend ActiveSupport::Concern

  ORDER_BY_AVERAGE = 'case when review_count = 0 then 0 else review_point / review_count end DESC'.freeze

  included do
    has_many :reviews, as: :reviewable, dependent: :destroy

    after_update :calcu_average

    scope :order_by_average, -> { unscope_order.order(ORDER_BY_AVERAGE) }

  end

  module InstanceMethods
    def calcu_average
      byebug
    end
  end

  def self.included(receiver)
    receiver.send :include, InstanceMethods
  end
end
