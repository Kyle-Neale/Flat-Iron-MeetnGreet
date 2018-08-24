class User < ApplicationRecord
  # has_many :messages
  has_many :matches
  has_many :matched_users, through: :matches, dependent: :destroy
  has_many :sent_requests
  has_many :requested_users, through: :sent_requests

  validates :mod, inclusion: 1..5, on: :update
  validates :user_name, presence: true
  validates :user_name, uniqueness: true
  validates :first_name, presence: true, on: :update
  validates :last_name, presence: true, on: :update
  validates :mod, presence: true, on: :update
  validates :hobbies, presence: true, on: :update
  has_secure_password

  def full_name
    self.first_name + " " + self.last_name
  end

  def my_requests
    # @sent_requests.each do |sent_request| %>
    #   <%= sent_request.requested_user_id if sent_request.requested_user_id == @user.id %>
    SentRequest.all.select do |request|
      request.requested_user == self
    end
  end

  def counted_requests
    my_requests.count
  end




end
