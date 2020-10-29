require 'rails_helper'

RSpec.describe Stat, type: :model do
  describe 'association' do
    it { should belong_to(:artist) }
  end
end
