require 'rails_helper'
RSpec.describe UrlsController, type: :controller do

  describe 'GET #index' do
    let!(:url) { Url.create({:original_url=> 'https://www.ecured.cu/EcuRed:Portal_del_colaborador', :short_url=>'test.angel/01ymsn', :title =>'Portal Ecuador'}) }

    context 'when user visit index page' do
        it 'should returns status code 200' do
            get :index
            expect(response).to have_http_status(:ok)
        end

        it 'should retrieve an array of url objects' do
            get :index
            result = JSON.parse(response.body)
            expect(result.count).to eq(1)
        end
    end
  end

  describe 'POST #create' do
  before do
    post :index, params:  {:data => {:original_url=> 'https://www.ecured.cu/EcuRed:Portal_del_colaborador', :title =>'Portal Ecuador'}}
  end
  context 'when user visit index page' do
      it 'should returns status code 200' do
          expect(response).to have_http_status(:ok)
      end
  end
end
end