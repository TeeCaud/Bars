require 'rails_helper'

RSpec.describe 'Bars drinks index' do
  it 'shows the name of each parent record in the system'

  chasers = Bar.create!(name: 'Chasers', specials: true, established: 2000, location: 'Lake Zurich')
  sideouts = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')

  visit "/bars/#{chasers.id}"
end
