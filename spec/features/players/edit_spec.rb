require 'rails_helper'

RSpec.describe 'the player edit' do
  it 'links to the edit page' do
    team = Team.create!( name: 'Nuggets', city: 'Denver', rank: 1, conference: "west", has_won_championship: false )
    player = team.players.create!( name: 'Nikola Jokić', age: 27, height_in_cm: 210, position: "center", is_a_rookie: false)
    visit "/players/#{player.id}"

    click_button "Edit #{player.name}"

    expect(current_path).to eq("/players/#{player.id}/edit")
  end

  it 'can edit the player' do
    team = Team.create!( name: 'Nuggets', city: 'Denver', rank: 1, conference: "west", has_won_championship: false )
    player = team.players.create!( name: 'Nikoa Jokić', age: 27, height_in_cm: 210, position: "center", is_a_rookie: false)

    visit "/players/#{player.id}"

    expect(page).to have_content('Nikoa Jokić')

    click_button 'Edit Nikoa Jokić'

    fill_in 'Name', with: 'Nikola Jokić'
    click_button 'Update Nikoa Jokić'

    expect(current_path).to eq("/players/#{player.id}")
    expect(page).to have_content('Nikola Jokić')
  end
end