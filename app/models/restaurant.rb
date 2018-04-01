class Restaurant < ApplicationRecord
  include NameBehavior
  include AASM

  acts_as_paranoid
  geocoded_by :address

  enum state: %i[pending approved suspended publiced]

  aasm column: 'state', enum: true do
    state :pending, initial: true
    state :approved, :suspended, :publiced

    event :approve do
      transitions from: :pending, to: :approved, after: :send_email_approve
      transitions from: :publiced, to: :approved
    end

    event :reject, after: :send_email_reject do
      transitions from: %i[pending approved publiced], to: :suspended
    end

    event :repending, after: :remove_comment do
      transitions from: :suspended, to: :pending
    end

    event :published do
      transitions from: :approved, to: :publiced
    end
  end

  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'

  has_many :album_images, dependent: :destroy

  accepts_nested_attributes_for :album_images, allow_destroy: true, reject_if: proc { |attributes| attributes['temp_url'].blank? }

  validates :name, :address, presence: true, length: { minimum: 1, maximum: 254 }
  validates :desc, length: { minimum: 0, maximum: DESC_MAX_LENGTH }
  validates :phone, length: { minimum: 10, maximum: 15 }
  validates :comment, presence: true, if: Proc.new { |restaurant| restaurant.suspended? }

  after_validation :geocode, if: :address_changed?

  def send_email_approve
    SendEmailRestaurantJob.perform_later('approved', self, owner, I18n.locale.to_s)
  end

  def send_email_reject
    SendEmailRestaurantJob.perform_later('suspended', self, owner, I18n.locale.to_s)
  end

  def remove_comment
    update_attribute('comment', nil)
  end
end
