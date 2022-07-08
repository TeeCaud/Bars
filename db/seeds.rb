# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
sideouts = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')
chasers = Bar.create!(name: 'Chasers', specials: true, established: 2000, location: 'Lake Zurich')
beer = sideouts.drinks.create!(name: 'Beer', quantity: 10000, alcohol: true)
vodka = sideouts.drinks.create!(name: 'Vodka', quantity: 35, alcohol: true)
coke = sideouts.drinks.create!(name: 'Coke', quantity: 100, alcohol: false)
water = sideouts.drinks.create!(name: 'Water', quantity: 999, alcohol: false)
