class Pronostic < ApplicationRecord
  belongs_to :prono_site
  belongs_to :match

  validates :prono_site, presence: true
  validates :match, presence: true
  validates :date, presence: true
  validates :prediction, presence: true
end
