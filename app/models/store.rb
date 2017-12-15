class Store < ApplicationRecord
  has_many   :items
  belongs_to :user

  before_save :add_url

  enum status: [ :pending, :active, :suspended ]

  before_validation :generate_slug

  def to_param
    slug # or "#{id}-#{name}".parameterize
  end

  def generate_slug
    self.slug ||= name.parameterize
  end

  def add_url
    self.url = name.parameterize
  end
end
