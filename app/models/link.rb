class Link < ApplicationRecord
  validates_uniqueness_of :url
end
