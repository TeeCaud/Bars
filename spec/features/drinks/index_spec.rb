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

  it 'links to drinks index' do
    bar = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')
    beer = bar.drinks.create!(name: 'Beer', quantity: 10000, alcohol: true)
    drinks = "/drinks"

    visit "/bars"
    click_on "Drinks"

    expect(current_path).to eq("/drinks")
  end

  describe 'only shows true records' do
    it 'shows the drinks the contain alcohol' do

      sideouts = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')
      chasers = Bar.create!(name: 'Chasers', specials: true, established: 2000, location: 'Lake Zurich')
      beer = sideouts.drinks.create!(name: 'Beer', quantity: 10000, alcohol: true)
      vodka = sideouts.drinks.create!(name: 'Vodka', quantity: 35, alcohol: true)
      coke = sideouts.drinks.create!(name: 'Coke', quantity: 100, alcohol: false)
      water = sideouts.drinks.create!(name: 'Water', quantity: 999, alcohol: false)
      whiskey = sideouts.drinks.create!(name: 'Whiskey', quantity: 150, alcohol: true)

      visit '/drinks'

      expect(page).to have_content(beer.name)
      expect(page).to_not have_content(water.name)
      end
    end

    describe 'can edit a drink from the index page' do
      it 'takes me to a page to edit the drink' do
        sideouts = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')
        beer = sideouts.drinks.create!(name: 'Beer', quantity: 10000, alcohol: true)
        vodka = sideouts.drinks.create!(name: 'Vodka', quantity: 35, alcohol: true)

        visit '/drinks'
        click_on "Edit #{beer.name}"

        expect(current_path).to eq("/drinks/#{beer.id}/edit")
      end
    end
  end
