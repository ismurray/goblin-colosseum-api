class ItemSerializer < ActiveModel::Serializer
  attributes :id, :consumable, :name, :cost, :description
end
