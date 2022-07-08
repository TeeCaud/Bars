require 'rails_helper'

RSpec.describe Bar do
  it { should have_many :drinks }
end
