require 'rails_helper'

RSpec.describe Stat, type: :model do
  describe 'association' do
    it { should belong_to(:artist) }
  end

  describe 'validations' do
    it { should validate_presence_of(:hours) }
    it { should validate_presence_of(:artist_id) }
    it { should validate_presence_of(:track_name) }
    it { should validate_numericality_of(:hours).is_greater_than(0) }
  end
end
