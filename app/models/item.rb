class Item < ApplicationRecord
  has_many :purchases
  has_many :users, through: :appointments
end
