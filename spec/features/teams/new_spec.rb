require 'rails_helper'

RSpec.describe 'The Team creation' do
  it 'links to the new page from the Team index' do
    visit '/teams'

    click_link('New Team')
    expect(current_path).to eq('/teams/new')
  end

  it 'can create a new team' do
    visit '/teams/new'

    fill_in('Name', with: 'Warriors')
    click_button('Create Team')

    expect(current_path).to eq("/teams")
    expect(page).to have_content("Warriors")
  end
end