require 'rails_helper'

RSpec.describe 'the players index page' do
  it 'displays the players with their name, age, height, position, and rookie status' do
    team = Team.create!( name: 'Nuggets', city: 'Denver', rank: 1, confrence: "west", has_won_championship: false )
    player_1 = team.players.create!( name: 'Nikola Jokić', age: 27, height_in_cm: 210, position: "center", is_a_rookie: false)
    player_2 = team.players.create!( name: 'Jamal Murray', age: 25, height_in_cm: 193, position: "point guard", is_a_rookie: true)
    visit "/players" 

    expect(page).to have_content(player_1.name)
    expect(page).to have_content(player_1.age)
    expect(page).to have_content(player_1.height_in_cm)
    expect(page).to have_content(player_1.position)
    expect(page).to have_content(player_1.is_a_rookie)
    expect(page).to have_content(player_2.name)
    expect(page).to have_content(player_2.age)
    expect(page).to have_content(player_2.height_in_cm)
    expect(page).to have_content(player_2.position)
    expect(page).to have_content(player_2.is_a_rookie)
  end
end
