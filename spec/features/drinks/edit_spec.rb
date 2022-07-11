require 'rails_helper'

RSpec.describe 'drink update' do
  it 'links to the update page' do
    bar = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')
    beer = bar.drinks.create!(name: 'Beer', quantity: 10000, alcohol: true)

    visit "/drinks/#{beer.id}"
    expect(page).to have_content('Beer')

    click_on "Update Drink"
    visit "drinks/#{beer.id}/edit"

    expect(current_path).to eq("/drinks/#{beer.id}/edit")
    end

  it 'can edit the drink' do
    bar = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')
    beer = bar.drinks.create!(name: 'Beer', quantity: 10000, alcohol: true)

    visit "drinks/#{beer.id}"
    click_button "Update #{beer.name}"

    fill_in "Name", with: 'Beer'
    fill_in 'Quantity', with: '500'
    fill_in 'Alcohol', with: true

    click_button "Update Drink"

    expect(current_path).to eq("/drinks/#{beer.id}")
    expect(page).to have_content('Beer')
  end
end
