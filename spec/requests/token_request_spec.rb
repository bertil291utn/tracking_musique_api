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

  describe 'should return a successfull status' do
    let(:headers) { { Authorization: JsonWebToken.encode(user_id: user.id) } }
    before { post '/api/v1/valid_token', headers: headers }
    it { expect(response).to have_http_status(:success) }
    let(:json_response) { JSON.parse(response.body) }
    it { expect(json_response['message']).to eql('Valid token') }
  end

  describe 'should return a forbidden status' do
    let(:headers) { { Authorization: JsonWebToken.encode(user_id: -1) } }
    before { post '/api/v1/valid_token', headers: headers }
    it { expect(response).to have_http_status(:unauthorized) }
    let(:json_response) { JSON.parse(response.body) }
    it { expect(json_response['message']).to eql('Unauthorized token') }
  end
end
