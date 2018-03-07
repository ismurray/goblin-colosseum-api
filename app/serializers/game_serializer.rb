class GameSerializer < ActiveModel::Serializer
  attributes :id, :over, :score, :user_id
end
