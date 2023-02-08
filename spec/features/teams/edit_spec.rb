require 'rails_helper'

RSpec.describe 'the team edit' do
  it 'links to the edit page' do
    team = Team.create!( name: 'Nuggets', city: 'Denver', rank: 1, conference: "west", has_won_championship: false )
    visit '/teams'

    click_button "Edit #{team.name}"

    expect(current_path).to eq("/teams/#{team.id}/edit")
  end

  it 'can edit the team' do
    team = Team.create!( name: 'Nuggetx', city: 'Denver', rank: 1, conference: "west", has_won_championship: false )

    visit '/teams'

    expect(page).to have_content('Nuggetx')

    click_button 'Edit Nuggetx'

    fill_in 'Name', with: 'Nuggets'
    click_button 'Update Team'

    expect(current_path).to eq('/teams')
    expect(page).to have_content('Nuggets')
    expect(page).to_not have_content('Nuggetx')
  end
end