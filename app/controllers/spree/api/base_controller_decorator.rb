Spree::Api::BaseController.class_eval do
  alias_method :old_product_scope, :product_scope
  def product_scope
    if params[:store_id]
      old_product_scope.joins(:stores).where(spree_stores: { id: params[:store_id] })
    else
      old_product_scope
    end
  end
end
