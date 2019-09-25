class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def edit
  end

  def update
  end
end
