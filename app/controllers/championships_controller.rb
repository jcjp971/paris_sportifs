class ChampionshipsController < ApplicationController
  def index
    @championships = Championship.all
  end
end
