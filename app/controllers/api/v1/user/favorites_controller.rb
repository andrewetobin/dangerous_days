class Api::V1::User::FavoritesController < ApiBaseController

  def index

    favorites = Favorite.new
    neo_id = favorites.search(current_user).neo_reference_id
    # https://api.nasa.gov/neo/rest/v1/neo/3542519?api_key=DEMO_KEY

    conn = Faraday.new(url: "https://api.nasa.gov") do |faraday|
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/neo/rest/v1/neo/#{neo_id}?api_key=#{ENV['key']}")
    #
    results = JSON.parse(response.body, symbolize_names: true)

    render json: results.merge({"user_id" => current_user.id}), serializer: FavoriteSerializer


    # find user, find favorite asteroid, serializer
    # https://api.nasa.gov/neo/rest/v1/neo/3542519?api_key=DEMO_KEY
  end

end
