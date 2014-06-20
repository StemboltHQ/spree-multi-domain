require 'spec_helper'

module Spree
  describe BaseHelper do
    before(:each) do
      @store = FactoryGirl.create(:store,
        meta_keywords: 'foo bar',
        meta_description: 'stuff and things'
      )

      helper.stub(:current_store) { @store }
    end

    describe "#meta_data" do
      it "uses the keyword/description from the current store" do
        metadata = helper.meta_data
        metadata[:keywords].should == 'foo bar'
        metadata[:description].should == 'stuff and things'
      end
    end
  end
end
