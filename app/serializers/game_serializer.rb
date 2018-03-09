class GameSerializer < ActiveModel::Serializer
  attributes :id, :over, :score, :user_id, :player_state, :goblin_state
end
