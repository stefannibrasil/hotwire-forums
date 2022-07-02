class Discussion < ApplicationRecord
  belongs_to :user, default: -> { Current.user }
  has_many :posts, dependent: :destroy

  validates :name, presence: true

  broadcasts

  def to_param
    "#{id}-#{name.downcase.to_s[0...100]}".parameterize
  end
end
