class MatchesController < ApplicationController
  def index
    @matches = Match.where("date > ?", Date.new(2019, 9, 1)).where("date < ?", Date.new(2019, 9, 30)).order(date: :desc)
  end

  def edit
  end

  def update
  end
end
