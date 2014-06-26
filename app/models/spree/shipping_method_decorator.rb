Spree::ShippingMethod.class_eval do
  has_many :store_shipping_methods
  has_many :stores, through: :store_shipping_methods

  def available_for_store?(order)
    order.store.nil? ||
    order.store.shipping_methods.empty? ||
    stores.include?(order.store)
  end
end
