require 'rails_helper'

RSpec.describe Drink, type: :model do
  describe 'relationships' do
  it { should belong_to :bar }
end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should allow_value(true).for(:alcohol) }
    it { should allow_value(false).for(:alcohol) }
    it { should validate_presence_of :quantity }
  end

  describe 'class methods' do
    describe 'returns true records' do
      it 'shows drinks with alcohol' do
        sideouts = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')
        chasers = Bar.create!(name: 'Chasers', specials: true, established: 2000, location: 'Lake Zurich')
        beer = sideouts.drinks.create!(name: 'Beer', quantity: 10000, alcohol: true)
        vodka = sideouts.drinks.create!(name: 'Vodka', quantity: 35, alcohol: true)
        coke = sideouts.drinks.create!(name: 'Coke', quantity: 100, alcohol: false)
        water = sideouts.drinks.create!(name: 'Water', quantity: 999, alcohol: false)
        whiskey = sideouts.drinks.create!(name: 'Whiskey', quantity: 150, alcohol: true)

        expect(Drink.true_records).to eq([beer, vodka, whiskey])
        # expect(Drink.where(alcohol: false)).to eq([coke, water])
        expect(Drink.true_records).to_not eq([coke, water])
      end
    end
  end
end
