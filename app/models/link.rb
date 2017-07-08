class Link < ApplicationRecord
  validates :url, url: true, presence: true
  validates_uniqueness_of :url
  validates_uniqueness_of :unique_id

  before_create :set_unique_id

  def set_unique_id
    self.unique_id ||= RandomString.generate(7)
  end
end
