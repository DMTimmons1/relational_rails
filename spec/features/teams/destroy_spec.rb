require 'rails_helper'

RSpec.describe 'destroying a team' do
  it 'can delete the team from the index page' do
    team = Team.create!( name: 'Nuggets', city: 'Denver', rank: 1, conference: "west", has_won_championship: false )

    visit '/teams'
    click_button "Delete #{team.name}"
    expect(current_path).to eq('/teams')
    expect(page).to_not have_content('Nuggets')
  end
end