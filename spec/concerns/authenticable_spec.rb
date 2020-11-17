require 'rails_helper'

class MockController
  include Authenticable
  attr_accessor :request

  def initialize
    mock_request = Struct.new(:headers)
    self.request = mock_request.new({})
  end
end

RSpec.describe 'Authenticable', type: :request do
  let(:user) { create :user }
  let(:authentication) { MockController.new }

  describe 'should get a user from Authorization token' do
    before { authentication.request.headers['Authorization'] = JsonWebToken.encode(user_id: user.id) }
    it { expect(authentication.current_user.id).to be(user.id) }
  end

  describe 'shoud not get user form empty Authorization token' do
    before { authentication.request.headers['Authorization'] = nil }
    it { expect(authentication.current_user).to be_nil }
  end
end
