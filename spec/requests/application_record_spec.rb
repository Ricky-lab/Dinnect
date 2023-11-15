require 'rails_helper'

RSpec.describe ApplicationController, type: :request do
  
  describe 'Accessing login page' do
    it 'successfully accesses the login page' do
      get '/login'
      expect(response).to have_http_status(:success)
    end
  end
end
