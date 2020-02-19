class Roster < ApplicationRecord
  belongs_to :user
  has_many :roster_players
  has_many :players, through: :roster_players
end
