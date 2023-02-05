require 'rails_helper'

RSpec.describe 'the teams show page' do
  it 'displays the teams name, city, rank, conference, and championships' do
    team_1 = Team.create!( name: 'Nuggets', city: 'Denver', rank: 1, conference: "west", has_won_championship: false )
    team_2 = Team.create!( name: 'Celtics', city: 'Boston', rank: 3, conference: "east", has_won_championship: false )
    player_1 = team_1.players.create!( name: 'Nikola Jokić', age: 27, height_in_cm: 210, position: "center", is_a_rookie: false)
    player_2 = team_1.players.create!( name: 'Jamal Murray', age: 25, height_in_cm: 193, position: "point guard", is_a_rookie: false)
    visit "/teams/#{team_1.id}" 

    expect(page).to have_content(team_1.name)
    expect(page).to have_content(team_1.city)
    expect(page).to have_content(team_1.rank)
    expect(page).to have_content(team_1.conference)
    expect(page).to have_content("Nuggets have won a championship: #{team_1.has_won_championship}")
    expect(page).to have_content("Number of players on The Nuggets: #{team_1.players.count}")
    expect(page).to_not have_content(team_2.name)
    expect(page).to_not have_content(team_2.city)
    expect(page).to_not have_content(team_2.rank)
    expect(page).to_not have_content(team_2.conference)
    expect(page).to_not have_content("Celtics have won a championship: #{team_2.has_won_championship}")
  end

end