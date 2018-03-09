class GameSerializer < ActiveModel::Serializer
  attributes :id, :over, :score, :user_id, :player_state
end
