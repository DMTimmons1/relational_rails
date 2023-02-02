class Team < ApplicationRecord
  has_many :players

  def average_team_height
    self.players.average(:height_in_cm)
  end
end