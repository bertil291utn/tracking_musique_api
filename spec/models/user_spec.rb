require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create :user }
  describe 'associations' do
    it { should have_many(:artists) }
    it { should have_many(:artists).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value('myemail@email.com').for(:email) }
    it { should_not allow_value('myemailemail.com').for(:email) }
  end

  describe 'destroy user destory linked artists' do
  end
end
