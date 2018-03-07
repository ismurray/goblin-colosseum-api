class GameSerializer < ActiveModel::Serializer
  attributes :id, :over, :score
end
