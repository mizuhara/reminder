require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe '#index' do
    it 'GETメソッドが成功する' do
      get :index
      expect(response).to be_successful
    end

    it 'GETメソッドのステータスコードが200である' do
      get :index
      expect(response).to have_http_status '200'
    end
  end
end
