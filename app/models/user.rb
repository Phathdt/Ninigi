class User < ApplicationRecord
  include NameBehavior

  rolify
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :sessions, dependent: :destroy
  has_many :restaurants, dependent: :destroy

  validates :name, length: { minimum: 6, maximum: 254 }, uniqueness: { case_sensitive: false }
end
