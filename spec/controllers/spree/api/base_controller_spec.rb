require 'spec_helper'

describe Spree::Api::ProductsController do
  stub_authorization!
  render_views

  let!(:product1) { create :product, name: "hello world" }
  let!(:product2) { create :product, name: "hello other world" }
  let!(:store) { Spree::Store.create!(name: "test", domains: "localhost", code: "test") }
  let(:query) {{ q: { name_cont: "hello"}, format: :json }}

  before do
    allow(controller).to receive(:try_spree_current_user).and_return(create :admin_user)
    store.products << product2
  end

  subject { spree_get :index, query }

  context "when the store id is present" do
    before do
      query.merge!(store_id: store.id)
    end

    it "returns only one product" do
      response = JSON.parse(subject.body)
      expect(response["products"].size).to eq 1
    end

    it "returns the correct product" do
      product = JSON.parse(subject.body)["products"].first
      expect(product["id"]).to eql(product2.id)
    end
  end

  context "when the store id is not present" do
    it "returns both products in the response" do
      response = JSON.parse(subject.body)
      expect(response["products"].size).to eq 2
    end
  end
end
