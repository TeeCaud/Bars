require 'rails_helper'

RSpec.describe 'delete a bar' do
  it 'can delete a bar from the show page' do
    sideouts = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')

    visit "/bars/#{sideouts.id}"

    expect(current_path).to eq("/bars/#{sideouts.id}")
    click_button "Delete #{sideouts.name}"

    expect(current_path).to eq("/bars")
    expect(page).to_not have_content('Sideouts')
  end

  it 'can delete a bar from the index page' do
    sideouts = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')
    chasers = Bar.create!(name: 'Chasers', specials: true, established: 2000, location: 'Lake Zurich')

    visit '/bars'
    expect(current_path).to eq('/bars')

    click_link "Delete #{sideouts.name}"
    expect(page).to_not have_content("Sideouts")
    expect(page).to have_content("Chasers")
  end
end
