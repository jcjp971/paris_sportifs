class RecommendationsController < ApplicationController
  def index
    @recommendations = Pronostic.joins(:match).order("matches.date DESC")
  end
end


