require 'rails_helper'

RSpec.describe 'bar update' do
  it 'links to the update page' do
    sideouts = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')

    visit "/bars/#{sideouts.id}"

    click_button "Update #{sideouts.name}"

    expect(current_path).to eq("/bars/#{sideouts.id}/edit")
  end

  it 'can edit the bar' do
      sideouts = Bar.create!(name: 'Sideout', specials: false, established: 1970, location: 'Island Lake')

      visit "/bars/#{sideouts.id}"
      expect(page).to have_content('Sideout')

      click_button "Update #{sideouts.name}"
      fill_in 'Name', with: 'Sideouts'
      fill_in 'Specials', with: true
      fill_in 'Established', with: 1970
      fill_in 'Location', with: 'Island Lake'

      click_button 'Update Bar'

      expect(current_path).to eq("/bars/#{sideouts.id}")
      expect(page).to have_content('Sideouts')
  end
end
