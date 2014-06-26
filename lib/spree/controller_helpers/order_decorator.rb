Spree::Core::ControllerHelpers::Order.module_eval do
  def current_currency
    currency = current_store.try(:default_currency)
    currency = Spree::Config[:currency] if currency.blank?
    currency
  end

  def current_order_with_multi_domain(options = {})
    options[:create_order_if_necessary] ||= false
    current_order_without_multi_domain(options)

    if @current_order && current_store && @current_order.store.nil?
      @current_order.update_column(:store_id, current_store.id)
    end

    @current_order
  end
  alias_method_chain :current_order, :multi_domain

  def set_current_order
    if user = try_spree_current_user
      last_incomplete_order = user.last_incomplete_order_on_store(current_store)
      if session[:order_id].nil? && last_incomplete_order
        session[:order_id] = last_incomplete_order.id
      elsif current_order(create_order_if_necessary: true) && last_incomplete_order && current_order != last_incomplete_order
        current_order.merge!(last_incomplete_order, user)
      end
    end
  end
end

