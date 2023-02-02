require 'rails_helper'

RSpec.describe 'Teams players index' do
  before :each do
    @team_1 = Team.create!( name: 'Nuggets', city: 'Denver', rank: 1, confrence: "west", has_won_championship: false )
    @player_1 = @team_1.players.create!( name: 'Nikola Jokić', age: 27, height_in_cm: 210, position: "center", is_a_rookie: false)
    @player_2 = @team_1.players.create!( name: 'Jamal Murray', age: 25, height_in_cm: 193, position: "point guard", is_a_rookie: false)
  end
  it 'shows all the players on the team' do
    visit "/teams/#{@team_1.id}/players"

    expect(page).to have_content(@player_1.name)
    expect(page).to have_content(@player_2.name)
  end

  it 'links to each players show page' do
    visit "/teams/#{@team_1.id}/players"

    click_on @player_1.name

    expect(current_path).to eq("/players/#{@player_1.id}")
  end

  it 'shows the average height of the team' do 
    visit "/teams/#{@team_1.id}/players"

    expect(page).to have_content("Average Player Height for Nuggets: 201")
  end
end