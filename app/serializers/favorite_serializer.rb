class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :neo_reference_id, :user_id, :asteroid

  def id
    object[:id]

  end

  def neo_reference_id
    object[:neo_reference_id]

  end

  def user_id
  end

  def asteroid

  end




end
