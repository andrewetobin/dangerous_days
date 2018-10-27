class MostDangerousDayController < ApplicationController

  def index
    @facade = AsteroidFacade.new(params)
  end
end
