class AsteroidFacade
  attr_reader :start_date, :end_date, :asteroids, :results

  def initialize(params)
    @params = params
    @results = service.asteroids_search[:near_earth_objects]
    @start_date = format_date((params["start_date"]).to_s)
    @results =results
    @end_date = format_date((params["end_date"]).to_s)
  end

  def most_dangerous_day
    hash = Hash.new(0)
    @results.each do |result|
      result[1].each do |asteroid|
        hash[result[0]] += 1 if asteroid[:is_potentially_hazardous_asteroid]
      end
    end
    hash.max_by{|k,v| v}[0]
  end

  def format_date(date)
    raw_date = date.to_s
    t = Time.new(raw_date)
    t.strftime("%B %e, %Y")
  end

  def asteroids
    asteroids = []
    @results[most_dangerous_day].each do |asteroid|
      asteroids << Asteroid.new(asteroid) if asteroid[:is_potentially_hazardous_asteroid]
    end
    asteroids
  end

  private

    def service
      AsteroidService.new(@params)
    end


end
