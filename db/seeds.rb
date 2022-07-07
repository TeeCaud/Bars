# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
bar = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')
beer = bar.drinks.create!(name: 'Beer', quantity: 10000, alcohol: true)
vodka = bar.drinks.create!(name: 'Vodka', quantity: 35, alcohol: true)
coke = bar.drinks.create!(name: 'Coke', quantity: 100, alcohol: false)
