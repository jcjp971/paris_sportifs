class Match < ApplicationRecord
  belongs_to :team1, class_name: 'Team'
  belongs_to :team2, class_name: 'Team'
  belongs_to :championship

  validates :date, presence: true
  validates :team1, presence: true, uniqueness: { scope: :date }
  validates :team2, presence: true
  validates :championship, presence: true
  validates :foot_api_fixture_id, presence: true, uniqueness: true
end
