class RecommendationsController < ApplicationController
  def index
    if params[:date].present?
      date = Date.commercial(params[:date].to_date.year, params[:date].to_date.cweek)
      @recommendations = Pronostic.joins(:match).where("matches.date > ?", date).where("matches.date > ?", date).order("matches.date DESC")
    else
      date = Date.commercial(Date.today.year, Date.today.cweek)
      @recommendations = Pronostic.joins(:match).where("matches.date > ?", date).where("matches.date > ?", date).order("matches.date DESC")
    end
  end
end


