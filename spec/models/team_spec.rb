require 'rails_helper'

RSpec.describe Team, type: :model do
  it {should have_many :players}

  describe 'instance methods' do
    describe '#average_team_height' do
      before :each do
        @team_1 = Team.create!( name: 'Nuggets', city: 'Denver', rank: 1, confrence: "west", has_won_championship: false )
        @player_1 = @team_1.players.create!( name: 'Nikola Jokić', age: 27, height_in_cm: 210, position: "center", is_a_rookie: false)
        @player_2 = @team_1.players.create!( name: 'Jamal Murray', age: 25, height_in_cm: 193, position: "point guard", is_a_rookie: false)
      end
      it 'returns the average team height' do
        expect(@team_1.average_team_height.round(2)).to eq(201.50)
      end
    end
  end
end