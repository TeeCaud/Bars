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
end
