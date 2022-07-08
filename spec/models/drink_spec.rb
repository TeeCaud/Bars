require 'rails_helper'

RSpec.describe Drink, type: :model do
  it { should belong_to :bar}
end
