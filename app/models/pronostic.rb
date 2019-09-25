class Pronostic < ApplicationRecord
  belongs_to :prono_site
  belongs_to :match
  belongs_to :team
end
