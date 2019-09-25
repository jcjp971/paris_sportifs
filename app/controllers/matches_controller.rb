class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def edit
  end

  def update
  end
end
