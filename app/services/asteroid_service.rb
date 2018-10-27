class AsteroidService

  def initialize(params)
    @end_date = params["end_date"]
    @start_date = params["start_date"]
  end

  def asteroids_search
    get_json("/neo/rest/v1/feed?start_date=#{@start_date}&end_date=#{@end_date}&api_key=#{ENV['key']}")
  end


   private

      def conn
        Faraday.new(url: "https://api.nasa.gov") do |faraday|
          faraday.adapter Faraday.default_adapter
        end
      end

      def get_json(url)
        JSON.parse(conn.get(url).body, symbolize_names: true)
      end

end
