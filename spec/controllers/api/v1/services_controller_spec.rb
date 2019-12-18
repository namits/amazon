require 'rails_helper'

RSpec.describe Api::V1::ServicesController, type: :controller do

  describe "Services V1 Api" do
    context 'unauthorised' do
      it 'gets 401 unauthorised response' do
        get 'region', params: { region: 'India' }
        expect(response.status).to eq(403)
      end
    end

    context 'authorised' do
      it 'authorised response' do
        request.headers['X-Parse-REST-API-Key'] = API_TOKEN
        get 'region', params: {region: 'India'}
        expect(response.status).to eq(200)
      end
    end

    context 'specific region' do
      it "to view pricing for a specific region" do
        request.headers['X-Parse-REST-API-Key'] = API_TOKEN
        get 'region', params: {region: 'India'}
        # For now checking only status
        expect(response).to have_http_status(:success)
      end
    end

    context 'specific region with date' do
      it "to view pricing for a specific region" do
        request.headers['X-Parse-REST-API-Key'] = API_TOKEN
        get 'region', params: {region: 'India', date: '2019-12-12'}
        # For now checking only status
        expect(response).to have_http_status(:success)
      end
    end
  end

end