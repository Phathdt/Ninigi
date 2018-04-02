class ManagerRequest < ApplicationRecord
  include AASM

  acts_as_paranoid
  enum state: %i[pending approved suspended retired]

  aasm column: 'state', enum: true do
    state :pending, initial: true
    state :approved, :suspended, :retired

    after_all_transitions :send_email_manager_request

    event :approve do
      transitions from: :pending, to: :approved
    end

    event :reject do
      transitions from: :pending, to: :suspended
    end

    event :repending do
      transitions from: :suspended, to: :pending
    end

    event :retire do
      transitions from: :approved, to: :retired
    end
  end

  belongs_to :restaurant
  belongs_to :manager, class_name: "User", foreign_key: 'user_id'

  after_create :send_email_pending

  private

  def send_email_pending
    ManagerRestaurantMailer.send_email(restaurant, manager, :initial, :pending, I18n.locale.to_s).deliver
  end

  def send_email_manager_request
    ManagerRestaurantMailer.send_email(restaurant, manager, aasm.from_state, aasm.to_state, I18n.locale.to_s).deliver
  end
end
