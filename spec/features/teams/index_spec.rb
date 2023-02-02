require 'rails_helper'

RSpec.describe 'the teams show page' do
  it 'displays the teams name, city, rank, confrence, and championships' do
    team_1 = Team.create!( name: 'Nuggets', city: 'Denver', rank: 1, confrence: "west", has_won_championship: false )
    team_2 = Team.create!( name: 'Celtics', city: 'Boston', rank: 2, confrence: "east", has_won_championship: true )
    visit "/teams" 

    expect(page).to have_content(team_1.name)
    expect(page).to have_content(team_1.city)
    expect(page).to have_content(team_1.rank)
    expect(page).to have_content(team_1.confrence)
    expect(page).to have_content(team_1.has_won_championship)
    expect(page).to have_content(team_2.name)
    expect(page).to have_content(team_2.city)
    expect(page).to have_content(team_2.rank)
    expect(page).to have_content(team_2.confrence)
    expect(page).to have_content(team_2.has_won_championship)
  end
end