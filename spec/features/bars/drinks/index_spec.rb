require 'rails_helper'

RSpec.describe 'Bars drinks index' do
  it 'displays each drink and attribute for each bar' do

  chasers = Bar.create!(name: 'Chasers', specials: true, established: 2000, location: 'Lake Zurich')
  sideouts = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')

  juice = chasers.drinks.create!(name: 'Juice', quantity: 2, alcohol: false)
  beer = sideouts.drinks.create!(name: 'Beer', quantity: 10000, alcohol: true)
  vodka = sideouts.drinks.create!(name: 'Vodka', quantity: 35, alcohol: true)
  coke = sideouts.drinks.create!(name: 'Coke', quantity: 100, alcohol: false)
  water = sideouts.drinks.create!(name: 'Water', quantity: 999, alcohol: false)

  visit "/bars/#{sideouts.id}/drinks"

  expect(page).to_not have_content(juice.name)
  expect(page).to have_content(beer.name)
  expect(page).to have_content(beer.quantity)
  expect(page).to have_content(beer.alcohol)
  expect(page).to have_content(vodka.name)
  expect(page).to have_content(vodka.quantity)
  expect(page).to have_content(vodka.alcohol)
  end
end
