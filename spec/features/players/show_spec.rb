require 'rails_helper'

RSpec.describe 'the players show page' do
  it 'displays the player name, age, height, position, and rookie status' do
    team = Team.create!( name: 'Nuggets', city: 'Denver', rank: 1, confrence: "west", has_won_championship: false )
    player_1 = team.players.create!( name: 'Nikola Jokić', age: 27, height_in_cm: 210, position: "center", is_a_rookie: false)
    player_2 = team.players.create!( name: 'Jamal Murray', age: 25, height_in_cm: 193, position: "point guard", is_a_rookie: false)
    visit "/players/#{player_1.id}" 

    expect(page).to have_content(player_1.name)
    expect(page).to have_content(player_1.age)
    expect(page).to have_content(player_1.height_in_cm)
    expect(page).to have_content(player_1.position)
    expect(page).to_not have_content(player_2.name)
    expect(page).to_not have_content(player_2.age)
    expect(page).to_not have_content(player_2.height_in_cm)
    expect(page).to_not have_content(player_2.position)
  end

  it "displays the team the player belongs to" do
    team = Team.create!( name: 'Nuggets', city: 'Denver', rank: 1, confrence: "west", has_won_championship: false )
    player_1 = team.players.create!( name: 'Nikola Jokić', age: 27, height_in_cm: 210, position: "center", is_a_rookie: false)
    player_2 = team.players.create!( name: 'Jamal Murray', age: 25, height_in_cm: 193, position: "point guard", is_a_rookie: false)
    visit "/players/#{player_1.id}" 

    expect(page).to have_content(team.name)
  end

end