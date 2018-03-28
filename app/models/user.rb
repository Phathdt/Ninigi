class User < ApplicationRecord
  rolify
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :sessions, dependent: :destroy
  has_many :restaurants, dependent: :destroy
end
