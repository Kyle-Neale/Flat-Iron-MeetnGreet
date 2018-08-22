class User < ApplicationRecord
  # has_many :messages
  has_many :matches
  has_many :matched_users, through: :matches, dependent: :destroy
  has_many :sent_requests
  has_many :requested_users, through: :sent_requests

  validates :mod, inclusion: 1..5
  validates :user_name, presence: true
  validates :user_name, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :mod, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  has_secure_password


end
