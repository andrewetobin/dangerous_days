class Favorite < ApplicationRecord
  belongs_to :user

  def search(user)
    Favorite.find_by(user.id = user_id)

  end
end
