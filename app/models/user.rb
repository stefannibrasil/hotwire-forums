class User < ApplicationRecord
  before_save :downcase_username

  has_secure_password

  validates :username, presence: true, uniqueness: true

  def downcase_username
    self.username = username.downcase
  end
end