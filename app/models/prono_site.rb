class PronoSite < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :url, presence: true
  validates :logo, presence: true
end
