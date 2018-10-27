class Asteroid
  attr_reader :name, :neo_id

  def initialize(attributes)
    @name = attributes[:name]
    @neo_id = attributes[:neo_reference_id]
  end


end
