require 'random_string'

class Link < ApplicationRecord
  validates :url, url: { message: "This doesn't seem like a valid URL." }, allow_blank: true
  validates_presence_of :url, message: "It seems you didn't enter a URL."
  validates_uniqueness_of :url
  validates_uniqueness_of :unique_id

  before_create :set_unique_id

  def set_unique_id
    self.unique_id ||= RandomString.generate(7)
  end
end
