require 'rails_helper'

RSpec.describe 'the bars show page' do
  it 'shows the the bar id and bar attributes' do
    bar = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')

    visit "/bars/#{bar.id}"
    expect(page).to have_content(bar.name)
    expect(page).to have_content(bar.id)
    expect(page).to have_content(bar.specials)
    expect(page).to have_content(bar.established)
    expect(page).to have_content(bar.location)
  end

  it 'shows a count of the number of drinks associated to the bar' do
    sideouts = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')

    beer = sideouts.drinks.create!(name: 'Beer', quantity: 10000, alcohol: true)
    vodka = sideouts.drinks.create!(name: 'Vodka', quantity: 35, alcohol: true)
    coke = sideouts.drinks.create!(name: 'Coke', quantity: 100, alcohol: false)
    water = sideouts.drinks.create!(name: 'Water', quantity: 999, alcohol: false)

    visit "bars/#{sideouts.id}"

    expect(sideouts.drinks.count).to eq(4)
    expect(page).to have_content("Drink Options: 4")
  end

  it 'links the parents child table from the parent show page' do
    sideouts = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')

    beer = sideouts.drinks.create!(name: 'Beer', quantity: 10000, alcohol: true)
    vodka = sideouts.drinks.create!(name: 'Vodka', quantity: 35, alcohol: true)
    coke = sideouts.drinks.create!(name: 'Coke', quantity: 100, alcohol: false)
    water = sideouts.drinks.create!(name: 'Water', quantity: 999, alcohol: false)

    visit "bars/#{sideouts.id}"
    click_on "Drink Options"

    expect(current_path).to eq("/bars/#{sideouts.id}/drinks")
  end
end
