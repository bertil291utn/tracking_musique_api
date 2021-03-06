# rubocop:disable Layout/LineLength
require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:usuario) { create :user }
  let(:params_user) { { user: { name: usuario.name, email: usuario.email, password: usuario.password_digest } } }

  describe 'should show user' do
    let(:artist) { create :artist }
    let(:usuario) { artist.user }
    before { get "/api/v1/user_artists/#{usuario.id}" }
    it { expect(response).to have_http_status(:success) }

    let(:json_response) { JSON.parse(response.body, symbolize_names: true) }
    it { expect(json_response.dig(:data, :attributes, :email)).to match(usuario.email) }
    it { expect(json_response.dig(:data, :relationships, :artists, :data, 0, :id)).to match(usuario.artists.first.id.to_s) }
    it { expect(json_response.dig(:included, 0, :attributes, :id_string)).to match(usuario.artists.first.id_string) }
  end

  describe 'create user' do
    before { post '/api/v1/users', params: { user: { name: 'newuser', email: 'new@email.com', password: 'password' } } }
    it { expect(response).to have_http_status(:created) }

    context 'existed email' do
      before { post '/api/v1/users', params: params_user }
      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

  describe 'should update user' do
    before { put "/api/v1/users/#{usuario.id}", params: params_user }
    it { expect(response).to have_http_status(:success) }
  end

  describe 'should not update user, invalid email' do
    before do
      params_user[:user][:email] = 'bad email'
      put "/api/v1/users/#{usuario.id}", params: params_user
    end
    it { expect(response).to have_http_status(:unprocessable_entity) }
  end

  describe 'should destroy user' do
    before { delete "/api/v1/users/#{usuario.id}" }
    it { expect(response).to have_http_status(:no_content) }
  end
end
# rubocop:enable Layout/LineLength
