require 'rails_helper'

RSpec.describe 'the drink creation' do
  it 'links to the new page' do
    sideouts = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')
    whiskey = sideouts.drinks.create!(name: 'Whiskey', quantity: 150, alcohol: true)

    visit "/bars/#{sideouts.id}/drinks"
    click_link("Create Drink")

    expect(current_path).to eq("/bars/#{sideouts.id}/drinks/new")
  end

  it 'can add a drink to the bar' do
    sideouts = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')
    visit "bars/#{sideouts.id}/drinks/new"

    fill_in('Name', with: 'Whiskey')
    fill_in('Alcohol', with: true)
    fill_in('quantity', with: 150)

    click_button('Create Drink')

    expect(current_path).to eq("/bars/#{sideouts.id}/drinks")
    expect(page).to have_link('Create Drink')
    expect(page).to have_content("Whiskey")
  end
end
