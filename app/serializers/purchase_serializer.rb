class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :item
  has_one :user
  has_one :item
end
