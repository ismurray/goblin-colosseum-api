# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :games
  has_many :purchases
  has_many :items, through: :purchases
end
