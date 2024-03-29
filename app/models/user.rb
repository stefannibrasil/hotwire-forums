class User < ApplicationRecord
  before_save :downcase_username

  has_secure_password

  validates :username, presence: true, uniqueness: true

  has_many :discussions, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :discussion_subscriptions, dependent: :destroy
  has_many :notifications, as: :recipient

  def downcase_username
    self.username = username.downcase
  end
end
