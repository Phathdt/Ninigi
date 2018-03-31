class Restaurant < ApplicationRecord
  include NameBehavior
  include AASM

  acts_as_paranoid
  geocoded_by :address

  enum state: %i[pending approved suspended published]

  aasm column: 'state', enum: true do
    state :pending, initial: true
    state :approved, :suspended, :published

    after_all_transitions :log_status_change

    event :approve do
      transitions from: :pending, to: :approved, after: :send_email_approve
      transitions from: :published, to: :approved
    end

    event :reject do
      transitions from: [:pending, :approved, :published], to: :suspended, after: :send_email_reject
    end

    event :re_pending do
      transitions from: :suspended, to: :pending
    end

    event :public do
      transitions from: :approved, to: :published
    end
  end

  after_validation :geocode, if: :address_changed?

  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'

  validates :name, :address, presence: true, length: { minimum: 1, maximum: 254 }
  validates :desc, length: { minimum: 0, maximum: DESC_MAX_LENGTH }
  validates :phone, length: { minimum: 10, maximum: 15 }
  validates :comment, presence: true, if: Proc.new { |restaurant| restaurant.suspended? }

  def log_status_change
    puts "changing from #{aasm.from_state} to #{aasm.to_state} (event: #{aasm.current_event})"
  end

  def send_email_approve
    p 'gui mail approve cho user'
  end

  def send_email_reject
    p 'gui mail suspend cho user'
  end

  def remove_comment
    update_attribute('comment', nil)
  end
end
