class MatchesController < ApplicationController
  def index
    if params[:date].present?
      date = Date.commercial(params[:date].to_date.year, params[:date].to_date.cweek)
      @matches = Match.joins(:championship).where("championships.name = ?", 'Ligue 1').where("date > ?", date).where("date < ?", date + 7).order(date: :asc)
    else
      date = Date.commercial(Date.today.year, Date.today.cweek)
      @matches = Match.joins(:championship).where("championships.name = ?", 'Ligue 1').where("date > ?", date).where("date < ?", date + 7).order(date: :asc)
    end
  end

  def edit
  end

  def update
  end
end
