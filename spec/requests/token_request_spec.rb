require 'rails_helper'

RSpec.describe 'Tokens', type: :request do
  let(:user) { create :user }
  describe 'should get JWT token' do
    before { post '/api/v1/tokens', params: { user: { email: user.email, password: 'g00d_pa$$' } } }
    it { expect(response).to have_http_status(:success) }
  end

  describe 'should not get JWT token' do
    before { post '/api/v1/tokens', params: { user: { email: user.email, password: 'bad_pa$$' } } }
    it { expect(response).to have_http_status(:unauthorized) }
  end
end
