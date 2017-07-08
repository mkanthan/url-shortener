require 'rails_helper'

RSpec.describe LinksController, type: :controller do

  let(:valid_attributes) { { url: "www.macrumors.com" } }
  let(:invalid_attributes) { { url: "asdfasdf" } }

  describe "POST create" do
    context "with valid params" do
      it "creates a new link if one doesn't exist in the database already" do
        expect {
          post :create, params: { link: valid_attributes, format: 'json' }
        }.to change(Link, :count).by(1)
      end

      it "responds with the last link" do
        post :create, params: { link: valid_attributes, format: 'json' }
        response_json = JSON.parse(response.body)
        expected_json = JSON.parse(Link.last.to_json)
        expect(response_json).to eq(expected_json)
      end
    end

    context "with invalid params" do
      it "returns an unprocessable entity" do
        post :create, params: { link: invalid_attributes, format: 'json' }
        expect(response.status).to eq(422)
        expect(JSON.parse(response.body)["errors"]).not_to be_nil
      end
    end
  end
end