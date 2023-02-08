require 'rails_helper'

RSpec.describe 'The Team Player creation' do
  before :each do
    @team_1 = Team.create!( name: 'Nuggets', city: 'Denver', rank: 1, conference: "west", has_won_championship: false )
    @player_1 = @team_1.players.create!( name: 'Nikola Jokić', age: 27, height_in_cm: 210, position: "center", is_a_rookie: false)
    @player_2 = @team_1.players.create!( name: 'Jamal Murray', age: 25, height_in_cm: 193, position: "point guard", is_a_rookie: false)
  end
  it 'links to the new page from the Team Player index' do
    visit "/teams/#{@team_1.id}/players"

    click_link("New #{@team_1.name} Player")
    expect(current_path).to eq("/teams/#{@team_1.id}/players/new")
  end

  it 'can create a new team player' do
    visit "/teams/#{@team_1.id}/players/new"

    fill_in(:name, with: 'Christan Braun')
    fill_in(:age, with: 24)
    fill_in(:height_in_cm, with: 210)
    fill_in(:position, with: 'shooting guard')
    choose(:is_a_rookie, option: 'true')
    click_button("Create #{@team_1.name} Player")

    expect(current_path).to eq("/teams/#{@team_1.id}/players/")
    expect(page).to have_content('Christan Braun')
  end
end