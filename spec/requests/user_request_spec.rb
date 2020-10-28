require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:usuario) { create :user }
  describe 'should show user' do
    it 'returns succes as http status response' do
      get "/api/v1/users/#{usuario.id}"
      expect(response).to have_http_status(:success)
    end

    it 'equal to email' do
      get "/api/v1/users/#{usuario.id}"
      json_response = JSON.parse(response.body)
      expect(json_response['email']).to match(usuario.email)
    end
  end
end
