class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :variant

  before_create :get_price, :calcu_amount

  acts_as_paranoid

  validates :quantity, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1
  }

  private

  def get_price
    self.price = self.variant.price
  end

  def calcu_amount
    self.amount = self.variant.price * self.quantity
  end
end
