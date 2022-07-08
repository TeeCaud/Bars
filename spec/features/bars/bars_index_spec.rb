require 'rails_helper'

RSpec.describe 'the bars show page' do
  it 'shows the name of each bar in the system' do
    sideouts = Bar.create!(name: 'Sideouts')
    chasers = Bar.create!(name: 'Chasers')

    visit "/bars"
# save_and_open_page
    expect(page).to have_content(sideouts.name)
  end
end
