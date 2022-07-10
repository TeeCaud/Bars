require 'rails_helper'

RSpec.describe 'the drinks index page' do
  it 'shows each drink in the system with attributes' do
    bar = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')
    beer = bar.drinks.create!(name: 'Beer', quantity: 10000, alcohol: true)
    # vodka = Drink.create!(name: 'Vodka', quantity: 35, alcohol: true)
    # coke = Drink.create!(name: 'Coke', quantity: 100, alcohol: false)
    # water = Drink.create!(name: 'Water', quantity: 999, alcohol: false)

    visit "/drinks"

    expect(page).to have_content(beer.name)
    expect(page).to have_content(beer.quantity)
    expect(page).to have_content(beer.alcohol)
  end
end
