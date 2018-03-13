# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :gold
  has_many :games
end
