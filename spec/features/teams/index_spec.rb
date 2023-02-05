require 'rails_helper'

RSpec.describe 'the teams show page' do
  it 'displays the teams name, city, rank, conference, and championships' do
    team_1 = Team.create!( name: 'Nuggets', city: 'Denver', rank: 1, conference: "west", has_won_championship: false )
    team_2 = Team.create!( name: 'Celtics', city: 'Boston', rank: 2, conference: "east", has_won_championship: true )
    visit "/teams" 

    expect(page).to have_content(team_1.name)
    expect(page).to have_content(team_1.city)
    expect(page).to have_content(team_1.rank)
    expect(page).to have_content(team_1.conference)
    expect(page).to have_content(team_1.has_won_championship)
    expect(page).to have_content(team_1.created_at)
    expect(page).to have_content(team_2.name)
    expect(page).to have_content(team_2.city)
    expect(page).to have_content(team_2.rank)
    expect(page).to have_content(team_2.conference)
    expect(page).to have_content(team_2.has_won_championship)
    expect(page).to have_content(team_2.created_at)
  end
end