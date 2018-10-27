require 'rails_helper'

describe Asteroid, type: :model do
  it "exists" do
    attributes = {
      name: "Big Rock",
      neo_reference_id: "3771022"
      }
      asteroid = Asteroid.new(attributes)

      expect(asteroid).to be_a(Asteroid)
  end
  it "has attributes" do
    attributes = {
      name: "Big Rock",
      neo_reference_id: "3771022"
      }
      asteroid = Asteroid.new(attributes)

      expect(asteroid.name).to eq("Big Rock")
      expect(asteroid.neo_id).to eq("3771022")
  end
end
# describe "class methods" do
#   it "can find most dangerous day" do
#     asteroid_1 = Asteroid.new({name: "Big Rock",
#       neo_reference_id: "3771022"
#       })
#     asteroid_2 = Asteroid.new({name: "Far Rock",
#       neo_reference_id: "3741122"
#       })
#
#       expect(Asteroid.most_dangerous_day).to eq("01-01-2018")
#   end
# end
