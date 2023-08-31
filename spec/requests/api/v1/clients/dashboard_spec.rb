require 'rails_helper'

RSpec.describe 'Dashboard', type: :request do
  describe 'GET /index' do
    context 'when exists establishments, courts and matches' do 
      it 're-sends confirmation' do
        post '/api/auth/confirmation', params: { email: user.email }
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
