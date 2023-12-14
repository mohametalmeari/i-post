require 'rails_helper'
RSpec.describe 'Home', type: :request do
  describe 'GET /index' do
    it 'renders home page' do
      get root_path
      expect(response).to render_template(:index)
      expect(response.body).to include('No Posts')
    end
  end
end
