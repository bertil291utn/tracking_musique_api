require 'rails_helper'

RSpec.describe Artist, type: :model do
  subject { create :artist }
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_length_of(:id_string).is_at_most(22) }
    it { should allow_value('6U5ySz3l4LtpaJ37pr3bGU').for(:id_string) }
    it { should_not allow_value('6U5ySz3l4&LtpaJ37pr3bGU').for(:id_string) }
  end
end
