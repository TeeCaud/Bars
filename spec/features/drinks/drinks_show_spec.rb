require 'rails_helper'

RSpec.describe 'the drinks show page' do
  it 'it displays the drink name' do
    bar = Bar.create!(name: 'Sideouts')
    beer = bar.drinks.create!(name: 'Beer', quantity: 10000, alcohol: true)
    vodka = bar.drinks.create!(name: 'Vodka', quantity: 35, alcohol: true)
    coke = bar.drinks.create!(name: 'Coke', quantity: 100, alcohol: false)

    visit "/drinks/#{beer.id}"

    expect(page).to have_content(beer.name)
    expect(page).to_not have_content(vodka.name)
  end

  it 'displays the name of bar for the drink' do
    bar = Bar.create!(name: 'Sideouts')
    beer = bar.drinks.create!(name: 'Beer', quantity: 10000, alcohol: true)
    vodka = bar.drinks.create!(name: 'Vodka', quantity: 35, alcohol: true)
    coke = bar.drinks.create!(name: 'Coke', quantity: 100, alcohol: false)

    visit "/drinks/#{beer.id}"
    # save_and_open_page

    expect(page).to have_content(bar.name)

  end
end
