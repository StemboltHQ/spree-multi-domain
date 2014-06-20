require 'spec_helper'

describe Spree::BaseController do

  describe "#default_title" do
    before do
      @store = FactoryGirl.create(:store, seo_title: "Fancy Mart")
      controller.stub(current_store: @store)
    end

    it "uses the seo title from the current store" do
      controller.default_title.should == "Fancy Mart"
    end
  end
end
