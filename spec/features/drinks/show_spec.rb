require 'rails_helper'

RSpec.describe 'the drinks show page' do
  it 'it displays the drink id and attributes' do
    bar = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')
    beer = bar.drinks.create!(name: 'Beer', quantity: 10000, alcohol: true)
    vodka = bar.drinks.create!(name: 'Vodka', quantity: 35, alcohol: true)
    coke = bar.drinks.create!(name: 'Coke', quantity: 100, alcohol: false)

    visit "/drinks/#{beer.id}"

    expect(page).to have_content(beer.name)
    expect(page).to_not have_content(vodka.name)
    expect(page).to have_content(beer.id)
    expect(page).to have_content(beer.quantity)
    expect(page).to have_content(beer.alcohol)
  end
end
