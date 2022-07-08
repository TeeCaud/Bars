require 'rails_helper'

RSpec.describe 'the bars show page' do
  it 'shows the the bar id and bar attributes' do
    bar = Bar.create!(name: 'Sideouts')
    bar_2 = Bar.create!(name: 'Chasers')

    visit "/bars/#{bar.id}"
    expect(page).to have_content(bar.name)
    expect(page).to have_content(bar.id)
    expect(page).to have_content(bar.specials)
    expect(page).to have_content(bar.established)
    expect(page).to have_content(bar.location)
  end
end
