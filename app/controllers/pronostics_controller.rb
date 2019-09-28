class PronosticsController < ApplicationController
  def index
    @pronostics = Pronostic.all
  end
end
