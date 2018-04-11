class Order < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  acts_as_paranoid
  geocoded_by :address

  enum state: %i[draft pending approved canceled shipping successed]

  aasm column: 'state', enum: true do
    state :draft, initial: true
    state :pending, :approved, :canceled, :shipping, :successed

    event :start do
      transitions from: :draft, to: :pending, after: :send_email_starting
    end

    event :approve do
      transitions from: :pending, to: :approved, after: :send_email_approve
    end

    event :reject, after: :send_email_reject do
      transitions from: :pending, to: :suspended, after: :send_email_reject
    end

    event :ship do
      transitions from: :approved, to: :shipping, after: :send_email_shipping
    end

    event :success do
      transitions from: :shipping, to: :successed, after: :send_email_success
    end
  end

  accepts_nested_attributes_for :order_items, allow_destroy: true,
    reject_if: proc { |attributes| attributes['quantity'].blank? }

  before_create :generate_hash_id, :calcu_amount

  has_many :order_items, dependent: :destroy
  has_many :variants, through: :order_items
  has_many :dishes, through: :variants

  validates :address, :note, presence: true, length: { minimum: 1, maximum: 254 }
  validates :phone, length: { minimum: 10, maximum: 15 }
  validates :comment, presence: true, if: Proc.new { |order| order.canceled? }

  private

  def send_email_starting

  end

  def send_email_approve

  end

  def send_email_reject

  end

  def send_email_shipping

  end

  def send_email_success

  end

  def generate_hash_id
    self.hash_id = rand(10**10+1..10**11)
  end

  def calcu_amount
    self.amount = order_items.sum(:amount)
  end
end
