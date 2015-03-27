require 'rails_helper'
require 'spec_helper'

describe HomeController, type: :controller do
  describe 'POST create' do
    before { post :create, params: { weight: 150, height: 5.6}, format: :js }

    it 'should succeed' do
      expect(response).to be_success
    end
  end
end