require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    let!(:users) { create_list(:user, 10) }

    before { get '/users' }

    it 'returns users' do
      expect(response).to have_http_status(200)
      json_response = JSON.parse(response.body)
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
  end
end