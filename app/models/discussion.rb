class Discussion < ApplicationRecord
  belongs_to :user, default: -> { Current.user }
  belongs_to :category, counter_cache: true, touch: true

  has_many :posts, dependent: :destroy

  validates :name, presence: true

  accepts_nested_attributes_for :posts

  broadcasts

  def to_param
    "#{id}-#{name.downcase.to_s[0...100]}".parameterize
  end
end
