class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :foot_api_team_id, presence: true, uniqueness: true
  validates :logo, presence: true, uniqueness: true

  has_many :home_matches, class_name: "Match", foreign_key: 'team1'
  has_many :away_goal_matches, class_name: "Match", foreign_key: 'team2'
end
