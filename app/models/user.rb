class User < ApplicationRecord
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :sessions, dependent: :destroy

  after_create :generate_session

  def generate_session
    sessions.create
  end
end
