class Championship < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :foot_api_league_key, presence: true, uniqueness: true
  validates :country_code, presence: true, uniqueness: true
end
