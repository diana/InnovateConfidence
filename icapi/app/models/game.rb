class Game < ApplicationRecord
  belongs_to :user
  has_many :scenarios
end
