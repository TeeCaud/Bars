require 'rails_helper'

RSpec.describe "the Bar creation" do
  it "links to the new page from the bars index" do
    sideouts = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')

    visit '/bars'
    click_link("New Bar")

    expect(current_path).to eq('/bars/new')
  end

  it 'can create a new bar' do
    visit '/bars/new'

    fill_in('Name', with: 'Oar')
    fill_in('Specials', with: true)
    fill_in('Established', with: 2000)
    fill_in('Location', with: 'Cary')
    click_button('Create Bar')

    expect(current_path).to eq('/bars')
    expect(page).to have_content("Oar")
  end
end
