require 'rails_helper'

RSpec.describe Api::V1::FlightsController, type: :controller do
   
   describe 'POST /v1/flights/paths' do
    
    let(:airport_paths_one) { [["SFO", "EWR"]].to_json }
    let(:airport_paths_two) { [["ATL", "EWR"], ["SFO", "ATL"]].to_json }
    let(:airport_paths_three) { [["IND", "EWR"], ["SFO", "ATL"], ["GSO", "IND"], ["ATL", "GSO"]].to_json }

    context 'when request airport_paths_one' do
      before do
        post :paths, body: airport_paths_one, format: :json
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end
      it "response with JSON body should be equal result one" do
        hash_body = nil
        expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
        expect(hash_body).to match({
          airport_code: ["SFO", "EWR"],
          ordered_paths: [["SFO", "EWR"]]
        })
      end
    end

    context 'when request airport_paths_two' do
      before do
        post :paths, body: airport_paths_two, format: :json
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end
      it "response with JSON body should be equal result one" do
        hash_body = nil
        expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
        expect(hash_body).to match({
          airport_code: ["SFO", "EWR"],
          ordered_paths: [["SFO", "ATL"], ["ATL", "EWR"]]
        })
      end
    end

    context 'when request airport_paths_three' do
      before do
        post :paths, body: airport_paths_three, format: :json
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end
      it "response with JSON body should be equal result one" do
        hash_body = nil
        expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
        expect(hash_body).to match({
          airport_code: ['SFO', 'EWR'],
          ordered_paths: [  
              ["SFO", "ATL"],
              ["ATL", "GSO"],
              ["GSO", "IND"],
              ["IND", "EWR"]
            ]
        })
      end
    end
    
  end
end
