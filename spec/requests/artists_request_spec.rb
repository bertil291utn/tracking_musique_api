require 'rails_helper'

RSpec.describe 'Artists', type: :request do
  let(:artist) { create :artist }

  describe 'should show an artist' do
    before { get "/api/v1/artists/#{artist.id}" }
    it { expect(response).to have_http_status(:success) }

    let(:json_response) { JSON.parse(response.body) }
    it { expect(json_response['id_string']).to match(artist.id_string) }
  end

  describe 'should display artists' do
    before { get '/api/v1/artists' }
    it { expect(response).to have_http_status(:success) }
  end
end
