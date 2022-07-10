require 'rails_helper'

RSpec.describe Bar do
  describe 'relationships' do
  it { should have_many :drinks }
end

  describe 'validations' do
  it { should validate_presence_of :name }
  it { should allow_value(true).for(:specials) }
  it { should allow_value(false).for(:specials) }
  it { should validate_presence_of :established }
  it { should validate_presence_of :location }
  end

  describe 'order by created at' do
    it 'displays records by most recently created first' do
      chasers = Bar.create!(name: 'Chasers', specials: true, established: 2000, location: 'Lake Zurich')
      sideouts = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')

      expect(Bar.order(created_at: :desc)).to eq([sideouts, chasers])
    end
  end
end
