require 'spec_helper'

describe Spree::ShippingMethod do
  let(:shipping_method) { create :shipping_method }
  let(:order) { create :order, :store => store }
  let(:store) { create :store }

  describe '.available_for_store?' do
    subject { shipping_method.available_for_store?(order) }

    context 'when the order does not belong to a store' do
      before { order.store = nil }
      it { should == true }
    end

    context 'when store contains this shipping method' do
      before { store.shipping_methods << shipping_method }
      it { should == true }
    end

    context "when the store does not contain this shipping method" do
      context "when the store has no shipping methods" do
        it { should == true }
      end

      context "when the store has at least on shipping method" do
        before { store.shipping_methods << FactoryGirl.create(:shipping_method) }
        it { should == false}
      end
    end
  end
end
