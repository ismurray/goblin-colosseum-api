class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :item, :created_at
  has_one :user
  has_one :item
end
