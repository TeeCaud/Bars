require 'rails_helper'

RSpec.describe 'delete a drink' do
  it 'deletes a drink from the show page' do
    bar = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')
    beer = bar.drinks.create!(name: 'Beer', quantity: 10000, alcohol: true)

    visit "/drinks/#{beer.id}"
    expect(current_path).to eq("/drinks/#{beer.id}")
    click_button  "Delete #{beer.name}"
    expect(current_path).to eq ("/drinks")
    expect(page).to_not have_content("Beer")
  end
end
